
variable "location" {}

variable "time_zone" {}

variable "daily_recurrence_time" {}

variable "automation_account_name" {}

variable "automation_schedule_name" {}

variable "start_time" {}

variable "sku_name" {}

variable "runbook_name" {}

variable "vm_name" {}

variable "user_assigned_id_name" {}

output "locals" {
  value = {
    "now"          = local.now # 2021-04-20T04:12:00Z,
    "EST_tz"  = local.est_tz
  }
}
