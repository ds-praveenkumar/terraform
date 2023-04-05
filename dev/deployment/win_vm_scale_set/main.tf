module "test_auto_scale" {

  source = "../../modules/win_vm_scale_set"

  auto_scale_profile_name = var.auto_scale_profile_name
  auto_scale_name         = var.auto_scale_name
  auto_scale_settings     = var.auto_scale_settings
  metric_name             = var.metric_name
  default_count           = var.default_count
  min_count               = var.min_count
  max_count               = var.max_count
  network_interface_name  = var.network_interface_name
  subnet_name             = var.subnet_name
  vnet_name               = var.vnet_name

}