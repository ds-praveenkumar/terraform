# main.tf

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# resource "azurerm_resource_group" "network-rg" {
#   name     = "test-rg"
#   location = var.location
# }

# Create the network VNET
resource "azurerm_virtual_network" "reval-vnet" {
  name                = "network-vnet" 
  address_space       = [var.network-vnet-cidr]
  resource_group_name = data.azurerm_resource_group.resource-group.name  #azurerm_resource_group.network-rg.name
  location            = var.location
}

# Create a subnet for endpoints
resource "azurerm_subnet" "reval-sn" {
  name                 = "reval-subnet"
  virtual_network_name = azurerm_virtual_network.reval-vnet.name
  resource_group_name  = data.azurerm_resource_group.resource-group.name  #azurerm_resource_group.network-rg.name
  address_prefixes     = [var.endpoint-subnet-cidr]
  service_endpoints = ["Microsoft.Storage"]
}


# Create Private DNS Zone
resource "azurerm_private_dns_zone" "dns-zone" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = data.azurerm_resource_group.resource-group.name  #azurerm_resource_group.network-rg.name
}

# Create Storage Account
resource "azurerm_storage_account" "reval-asa" {
  name                = "revalasa"
  resource_group_name = data.azurerm_resource_group.resource-group.name  #azurerm_resource_group.network-rg.name
  location            = var.location

  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"


    network_rules {
        bypass = ["Logging", "Metrics", "AzureServices"]
        default_action = "Deny"
        virtual_network_subnet_ids = [azurerm_subnet.reval-sn.id]
    }
    
    depends_on = [
	azurerm_virtual_network.reval-vnet,
	azurerm_subnet.reval-sn
  ]

}

resource "azurerm_storage_share" "file-share" {
  name                 = "ravelfs"
  storage_account_name = azurerm_storage_account.reval-asa.name
  quota                = 50

  
}

# Create Private Endpoint
resource "azurerm_private_endpoint" "endpoint" {
  name                = "reval_endpoint"
  resource_group_name = data.azurerm_resource_group.resource-group.name  #azurerm_resource_group.network-rg.name
  location            = var.location
  subnet_id           = azurerm_subnet.reval-sn.id

  private_service_connection {
    name                           = "ravel_psc"
    private_connection_resource_id = azurerm_storage_account.reval-asa.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
}

# Create DNS A Record
resource "azurerm_private_dns_a_record" "dns_a" {
  name                = "ravel_dns"
  zone_name           = azurerm_private_dns_zone.dns-zone.name
  resource_group_name = data.azurerm_resource_group.resource-group.name  #azurerm_resource_group.network-rg.name
  ttl                 = 300
  records             = [azurerm_private_endpoint.endpoint.private_service_connection.0.private_ip_address]
}

# resource "azurerm_storage_account_network_rules" "nwrules" {
#   storage_account_id = azurerm_storage_account.reval-asa.id

#   default_action             = "Allow"
#   ip_rules                   = ["127.0.0.1"]
#   virtual_network_subnet_ids = [azurerm_subnet.reval-sn.id]
#   bypass                     = ["Metrics"]
# }