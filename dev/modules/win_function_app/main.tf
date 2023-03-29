locals {
  resource_group_name = "test-rg"
  location            = "East US 2"
}

resource "random_string" "random" {
  length           = 4
  special          = false
  override_special = "/@£$"
  lower            = true
  number           = false
  numeric          = false
  upper            = false
}

resource "azurerm_service_plan" "test_sp" {
  name                = var.sp_name 
  resource_group_name = local.resource_group_name
  location            = local.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "example" {
  name                = "${var.fn_name}-${random_string.random.result}" 
  resource_group_name = local.resource_group_name
  location            = local.location

  storage_account_name       = data.azurerm_storage_account.sa.name
  storage_account_access_key = data.azurerm_storage_account.sa.primary_access_key
  service_plan_id            = azurerm_service_plan.test_sp.id

  site_config {}
}