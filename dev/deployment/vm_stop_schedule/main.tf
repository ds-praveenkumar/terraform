

module "vm_stop_sch" {
    source = "../../modules/vm_stop_schedule"

    vm_name = var.vm_name
    location = var.location
    timezone = var.timezone
    daily_recurrence_time = var.daily_recurrence_time

}