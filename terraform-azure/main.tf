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

resource "azurerm_resource_group" "network-rg" {
  name     = "test-rg"
  location = var.location
}

# Create the network VNET
resource "azurerm_virtual_network" "revel-vnet" {
  name                = "network-vnet"
  address_space       = [var.network-vnet-cidr]
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = azurerm_resource_group.network-rg.location
}

# Create a subnet for endpoints
resource "azurerm_subnet" "revel-sn" {
  name                 = "revel-subnet"
  virtual_network_name = azurerm_virtual_network.revel-vnet.name
  resource_group_name  = azurerm_resource_group.network-rg.name
  address_prefixes     = [var.endpoint-subnet-cidr]
}


# Create Private DNS Zone
resource "azurerm_private_dns_zone" "dns-zone" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.network-rg.name
}

# Create Storage Account
resource "azurerm_storage_account" "revel-asa" {
  name                = "revelasa"
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = var.location

  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "file-share" {
  name                 = "ravelfs"
  storage_account_name = azurerm_storage_account.revel-asa.name
  quota                = 50
}

# Create Private Endpoint
resource "azurerm_private_endpoint" "endpoint" {
  name                = "revel_endpoint"
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = var.location
  subnet_id           = azurerm_subnet.revel-sn.id

  private_service_connection {
    name                           = "ravel_psc"
    private_connection_resource_id = azurerm_storage_account.revel-asa.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
}

# Create DNS A Record
resource "azurerm_private_dns_a_record" "dns_a" {
  name                = "ravel_dns"
  zone_name           = azurerm_private_dns_zone.dns-zone.name
  resource_group_name = azurerm_resource_group.network-rg.name
  ttl                 = 300
  records             = [azurerm_private_endpoint.endpoint.private_service_connection.0.private_ip_address]
}

