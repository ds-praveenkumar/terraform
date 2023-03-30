

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
