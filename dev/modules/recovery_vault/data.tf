data "azurerm_resource_group" "resource-group" {
    name = "test-rg"
}

# data "azurerm_storage_account" "reval-asa" {
#     name = "revalasa"
#     resource_group_name = data.azurerm_resource_group.resource-group.name
# }

# data "azurerm_storage_share" "file_share" {
#     name = "ravelfs1"
#     storage_account_name = data.azurerm_storage_account.reval-asa.name
# }

# output "storage_account_name" {
#     value = azurerm_recovery_services_vault.smbc_rsv.name
# }
