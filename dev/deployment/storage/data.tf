

data "azurerm_subnet" "reval_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

# data "azurerm_virtual_network" "vnet" {
#   name                = var.vnet_name
#   resource_group_name = var.resource_group_name
# }
