

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


resource "azurerm_network_security_group" "smbc_nsg" {
  name                = "smbc-nsg"
  resource_group_name = data.azurerm_resource_group.resource-group.name
  location            = var.location

  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "web"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow_ssh_sg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}



# resource "azurerm_recovery_services_vault" "smbc_rsv" {
#   name                = "smbc-recovery-vault"
#   resource_group_name = data.azurerm_resource_group.resource-group.name
#   location            = var.location
#   sku                 = "Standard"
# }

# resource "azurerm_backup_policy_file_share" "smbc_bkp_fs" {
#   name                = "smbc-recovery-vault-policy"
#   resource_group_name = data.azurerm_resource_group.resource-group.name
#   recovery_vault_name = azurerm_recovery_services_vault.smbc_rsv.name

#   timezone = "UTC"

#   backup {
#     frequency = "Daily"
#     time      = "23:00"
#   }

#   retention_daily {
#     count = 10
#   }

#   retention_weekly {
#     count    = 7
#     weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
#   }

#   retention_monthly {
#     count    = 7
#     weekdays = ["Sunday", "Wednesday"]
#     weeks    = ["First", "Last"]
#   }

#   retention_yearly {
#     count    = 7
#     weekdays = ["Sunday"]
#     weeks    = ["Last"]
#     months   = ["January"]
#   }

#   depends_on = [
#     azurerm_recovery_services_vault.smbc_rsv
#   ]
# }


# resource "azurerm_backup_container_storage_account" "smbc_protection_container" {
#   resource_group_name = data.azurerm_resource_group.resource-group.name
#   recovery_vault_name = azurerm_recovery_services_vault.smbc_rsv.name
#   storage_account_id  = data.azurerm_storage_account.reval-asa.id
# }


# resource "azurerm_backup_protected_file_share" "smbc_bkp_file_share" {
#   resource_group_name       = data.azurerm_resource_group.resource-group.name
#   recovery_vault_name       = azurerm_recovery_services_vault.smbc_rsv.name
#   source_storage_account_id = azurerm_backup_container_storage_account.smbc_protection_container.storage_account_id
#   source_file_share_name    = data.azurerm_storage_share.file_share.name
#   backup_policy_id          = azurerm_backup_policy_file_share.smbc_bkp_fs.id
# }