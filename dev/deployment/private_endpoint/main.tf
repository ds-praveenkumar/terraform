

module "pvt_endpoint" {
    source = "../../modules/private_endpoint"

    pvt_end_point_name = var.pvt_end_point_name
    location = var.location
    subnet_id = data.azurerm_subnet.reval_subnet.id
    pvc_name = var.pvc_name
    storage_name = var.storage_name
}