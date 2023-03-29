

resource "azurerm_automation_account" "testautomation" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource-group.name
  sku_name            = var.sku_name
}


resource "azurerm_automation_schedule" "scheduledstartvm" {
  name                    = var.automation_schedule_name 
  resource_group_name     = data.azurerm_resource_group.resource-group.name
  automation_account_name = azurerm_automation_account.testautomation.name
  frequency               = "Day"
  interval                = 1
  timezone                = var.time_zone
  start_time              = var.start_time
  description             = "Run every day"
}

# resource "azurerm_automation_job_schedule" "startvm_sched" {
#   resource_group_name     = data.azurerm_resource_group.resource-group.name
#   automation_account_name = azurerm_automation_account.testautomation.name
#   schedule_name           = azurerm_automation_schedule.scheduledstartvm.name
#   runbook_name            = azurerm_automation_runbook.startstopvmrunbook.name
#    parameters = {
#     action        = "Start"
#   }
#   depends_on = [azurerm_automation_schedule.scheduledstartvm]
# }