
provider "azurerm" {
  features {}
}


module "reval_subnet" {
  source = "../../../modules/networking/subnet"

  subnet_name          = var.subnet_name 
  vnet_name            = var.vnet_name
  resource_group_name  = data.azurerm_resource_group.resource-group.name 
  endpoint_subnet_cidr = var.endpoint_subnet_cidr
  location             = var.location
  dns_zone_name        = var.dns_zone_name

}
