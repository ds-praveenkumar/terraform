
module "automation_schedule" {
    source = "../../modules/automation_schedule"

    automation_schedule_name = var.automation_schedule_name
    daily_recurrence_time    = var.daily_recurrence_time
    automation_account_name  = var.automation_account_name
    time_zone                = var.time_zone
    location                 = var.location
    start_time               = var.start_time
    sku_name                 = var.sku_name
    runbook_name             = var.runbook_name
    vm_name                  = var.vm_name
    user_assigned_id_name    = var.user_assigned_id_name
}