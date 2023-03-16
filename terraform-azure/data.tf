
data "azurerm_resource_group" "resource-group" {
    name = "test-rg"
}

data "azurerm_virtual_network" "vnet" {
    name = "network-vnet"
    resource_group_name = "test-rg"
}   