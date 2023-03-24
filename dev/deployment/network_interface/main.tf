

module "nic" {
    source = "../../modules/network_interface"

    network_interface_name = var.network_interface_name
    location = var.location
    ip_config_name = var.ip_config_name
    subnet_name = var.subnet_name
    vnet_name = var.vnet_name
}