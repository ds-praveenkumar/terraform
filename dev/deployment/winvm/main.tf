

module "winvm" {
    source = "../../modules/winvm"

    vm_name                = var.vm_name
    location               = var.location
    network_interface_name = var.network_interface_name
    daily_recurrence_time  = var.daily_recurrence_time
    timezone               = var.timezone
}


