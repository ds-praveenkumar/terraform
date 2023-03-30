

module "reval_vnet" {
  source = "../../modules/networking"

  vnet_name           = var.vnet_name 
  network_vnet_cidr   = var.network_vnet_cidr
  resource_group_name = data.azurerm_resource_group.resource-group.name 
  location            = var.location
  # subnet_name         = var.subnet_name
  # endpoint_subnet_cidr= var.endpoint_subnet_cidr

}
    
