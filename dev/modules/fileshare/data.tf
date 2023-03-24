
data "azurerm_resource_group" "resource-group" {
  name = "test-rg"
}

data "azurerm_storage_account" "sa" {
  name                = var.sa_name
  resource_group_name = data.azurerm_resource_group.resource-group.name
}