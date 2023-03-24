

data "azurerm_resource_group" "resource-group" {
  name = "test-rg"
}

data "azurerm_subnet" "reval_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = data.azurerm_resource_group.resource-group.name
}
