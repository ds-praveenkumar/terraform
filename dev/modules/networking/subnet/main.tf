

# Create a subnet for endpoints
resource "azurerm_subnet" "reval_subnet" {
  
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
  address_prefixes     = [var.endpoint_subnet_cidr]
  service_endpoints    = ["Microsoft.Storage"]
  # location             = var.location
}


# Create Private DNS Zone
resource "azurerm_private_dns_zone" "dns_zone" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
}