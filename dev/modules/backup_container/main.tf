

resource "azurerm_backup_container_storage_account" "smbc_protection_container" {
  resource_group_name = data.azurerm_resource_group.resource-group.name
  recovery_vault_name = data.azurerm_recovery_services_vault.test_srv.name
  storage_account_id  = data.azurerm_storage_account.sa.id  

}