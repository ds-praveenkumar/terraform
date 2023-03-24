

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
