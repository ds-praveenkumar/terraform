


data "azurerm_resource_group" "resource-group" {
  name = "test-rg"
}

variable "subnet_name" {}

variable "endpoint_subnet_cidr" {}

variable "location" {}

variable "vnet_name" {}

variable "dns_zone_name" {}


