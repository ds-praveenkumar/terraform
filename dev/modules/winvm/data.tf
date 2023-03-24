
data "azurerm_resource_group" "resource-group" {
  name = "test-rg"
}


data "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  resource_group_name = data.azurerm_resource_group.resource-group.name
}
