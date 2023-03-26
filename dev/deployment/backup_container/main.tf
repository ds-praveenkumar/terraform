


module "backup_container" {
  source = "../../modules/backup_container"

  recovery_vault_name = var.recovery_vault_name
  sa_name  = var.storage_name


}
