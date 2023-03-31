

resource "azurerm_windows_virtual_machine" "testvm" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.resource-group.name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "Pr@veen1234!"
  network_interface_ids = [
    data.azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}


resource "azurerm_dev_test_global_vm_shutdown_schedule" "test_vm_stop" {
  virtual_machine_id = azurerm_windows_virtual_machine.testvm.id # "/subscriptions/5756c94b-0727-4ed8-9609-09498ff37295/resourceGroups/test-rg/providers/Microsoft.Compute/virtualMachines/testvm"
  location           = var.location
  enabled            = true

  daily_recurrence_time = var.daily_recurrence_time 
  timezone              = var.timezone 

  notification_settings {
    enabled         = false
   
  }
 }


resource "azurerm_monitor_autoscale_setting" "test_auto_scale" {
  name                = var.auto_scale_settings
  resource_group_name = data.azurerm_resource_group.resource-group.name
  location            = var.location
  target_resource_id  = azurerm_windows_virtual_machine.testvm.id

  profile {
    name = var.auto_scale_profile_name

    capacity {
      default = var.default_count 
      minimum = var.min_count 
      maximum = var.max_count 
    }

    rule {
      metric_trigger {
        metric_name        = var.metric_name
        metric_resource_id = azurerm_windows_virtual_machine.testvm.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        dimensions {
          name     = "AppName"
          operator = "Equals"
          values   = ["App1"]
        }
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = var.metric_name
        metric_resource_id = azurerm_windows_virtual_machine.testvm.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }

  # notification {
  #   email {
  #     send_to_subscription_administrator    = true
  #     send_to_subscription_co_administrator = true
  #     custom_emails                         = ["admin@contoso.com"]
  #   }
  # }
}