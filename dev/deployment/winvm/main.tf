

module "winvm" {
    source = "../../modules/winvm"

    vm_name                = var.vm_name
    location               = var.location
    network_interface_name = var.network_interface_name
    daily_recurrence_time  = var.daily_recurrence_time
    timezone               = var.timezone
    auto_scale_settings    = var.auto_scale_settings
    auto_scale_profile_name= var.auto_scale_profile_name
    metric_name            = var.metric_name
    default_count          = var.default_count
    min_count              = var.min_count
    max_count              = var.max_count
}


