
module "reval_asa" {
    source = "../../modules/storage"

    sa_name             = var.storage_name
    resource_group_name = var.resource_group_name
    location            = var.location
    virtual_network_subnet_id= data.azurerm_subnet.reval_subnet.id
}