


resource "azurerm_virtual_network" "reval_vnet" {

  name                = var.vnet_name 
  address_space       = [var.network_vnet_cidr]
  resource_group_name = var.resource_group_name 
  location            = var.location
}


