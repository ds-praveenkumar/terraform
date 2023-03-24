

module "storage_account" {
    source = "../../modules/fileshare"

    file_share_name = var.file_share_name
    sa_name = var.storage_name
}