

resource "azurerm_dev_test_global_vm_shutdown_schedule" "test_vm_stop" {
  virtual_machine_id = "/subscriptions/5756c94b-0727-4ed8-9609-09498ff37295/resourceGroups/test-rg/providers/Microsoft.Compute/virtualMachines/testvm"
  location           = var.location
  enabled            = true

  daily_recurrence_time = var.daily_recurrence_time 
  timezone              = var.timezone 

  notification_settings {
    enabled         = false
   
  }
 }