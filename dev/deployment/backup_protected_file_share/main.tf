


module "backup_protected_file_share" {
  source = "../../modules/backup_protected_file_share"

    sa_name = var.new_storage_name
    recovery_vault_name = var.recovery_vault_name
}
