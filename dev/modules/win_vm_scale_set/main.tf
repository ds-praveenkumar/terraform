
locals {
  rg       = "test-rg"
  location = "East US 2"
}


resource "azurerm_windows_virtual_machine_scale_set" "testvmss" {

  name                = var.auto_scale_name
  resource_group_name = local.rg
  location            = local.location
  sku                 = "Standard_F2"
  instances           = 1
  admin_password      = "P@55w0rd1234!"
  admin_username      = "adminuser"

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = data.azurerm_network_interface.nic.name
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = data.azurerm_subnet.subnet.id
    }
  }
}

resource "azurerm_monitor_autoscale_setting" "example" {
  name                = var.auto_scale_settings
  resource_group_name = local.rg
  location            = local.location
  target_resource_id  = azurerm_windows_virtual_machine_scale_set.testvmss.id

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
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.testvmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 90
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "2"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = var.metric_name
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.testvmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 10
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "2"
        cooldown  = "PT1M"
      }
    }

    # recurrence {
    #   timezone = "Pacific Standard Time"
    #   days     = ["Saturday", "Sunday"]
    #   hours    = [12]
    #   minutes  = [0]
    # }
  }

  #   notification {
  #     email {
  #       send_to_subscription_administrator    = true
  #       send_to_subscription_co_administrator = true
  #       custom_emails                         = ["admin@contoso.com"]
  #     }
  #   }
}


