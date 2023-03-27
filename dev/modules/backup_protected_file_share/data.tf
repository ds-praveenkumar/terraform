

data "azurerm_resource_group" "resource-group" {
  name = "test-rg"
}

data "azurerm_storage_account" "sa" {
  name                = var.sa_name
  resource_group_name = data.azurerm_resource_group.resource-group.name
}

data "azurerm_recovery_services_vault" "test_srv" {
  name                = var.recovery_vault_name
  resource_group_name = data.azurerm_resource_group.resource-group.name
}