

locals {
  now = timestamp()

   est_tz  = timeadd(local.now, "+1.5h") # EST's official time
}



resource "azurerm_automation_account" "testautomation" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource-group.name
  sku_name            = var.sku_name

  identity {
    type         = "UserAssigned"
    identity_ids = [data.azurerm_user_assigned_identity.test_user.id]
  }
}


resource "azurerm_automation_schedule" "scheduledstartvm" {
  name                    = var.automation_schedule_name 
  resource_group_name     = data.azurerm_resource_group.resource-group.name
  automation_account_name = azurerm_automation_account.testautomation.name
  frequency               = "Day"
  interval                = 1
  timezone                = var.time_zone
  start_time              = local.est_tz
  description             = "Run every day"
}


resource "azurerm_automation_runbook" "test_runbook" {
  name                    = var.runbook_name
  location                = var.location
  resource_group_name     = data.azurerm_resource_group.resource-group.name
  automation_account_name = azurerm_automation_account.testautomation.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "This is an example runbook"
  runbook_type            = "PowerShell"

  content = data.local_file.ps_script.content
}


resource "azurerm_automation_job_schedule" "startvm_sched" {
  resource_group_name     = data.azurerm_resource_group.resource-group.name
  automation_account_name = azurerm_automation_account.testautomation.name
  schedule_name           = azurerm_automation_schedule.scheduledstartvm.name
  runbook_name            = azurerm_automation_runbook.test_runbook.name
   parameters = {
    vmname             = var.vm_name
    resourcegroupname  = data.azurerm_resource_group.resource-group.name
    action             = "Start"
  }
  depends_on = [azurerm_automation_schedule.scheduledstartvm]
}