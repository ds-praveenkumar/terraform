
module "manage_identity" {
    source = "../../modules/manage_identities"

    user_assigned_id_name = var.user_assigned_id_name
    role_name             = var.role_name
    location              = var.location
}