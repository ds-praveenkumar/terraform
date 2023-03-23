


resource "azurerm_recovery_services_vault" "smbc_rsv" {
  name                =  var.recovery_vault_name
  resource_group_name = data.azurerm_resource_group.resource-group.name
  location            = var.location
  sku                 = "Standard"
}
