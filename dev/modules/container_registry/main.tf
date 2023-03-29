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
}


resource "azurerm_container_registry" "acr" {
  name                = "${var.acr_name}${random_string.random.result}"
  resource_group_name = local.resource_group_name
  location            = local.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}