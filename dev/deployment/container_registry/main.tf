
module "acr" {

    source = "../../modules/container_registry"

    acr_name =  var.acr_name

}