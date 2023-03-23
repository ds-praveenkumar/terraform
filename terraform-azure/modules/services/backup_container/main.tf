

# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "=3.0.0"
#     }
#   }
# }

# # Configure the Microsoft Azure Provider
# provider "azurerm" {
#   features {}
# }

resource "azurerm_backup_container_storage_account" "smbc_protection_container" {
  resource_group_name = data.azurerm_resource_group.resource-group.name
  recovery_vault_name = var.recovery_vault_name  #azurerm_recovery_services_vault.smbc_rsv.name
  storage_account_id  = var.storage_account_id  #azurerm_storage_account.reval-asa.id
}

