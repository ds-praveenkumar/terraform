

data "azurerm_storage_account" "sa" {
  name                = var.sa_name
  resource_group_name = local.resource_group_name
}
