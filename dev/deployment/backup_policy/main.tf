


module "backup_policy" {
  source = "../../modules/backup_policy"

  service_vault_name = var.recovery_vault_name
  bkp_policy_name    = var.bkp_policy_name

}