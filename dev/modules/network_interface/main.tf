

resource "azurerm_network_interface" "testnic" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource-group.name

  # ip_configuration {
  #   name                          = "internal"
  #   subnet_id                     = azurerm_subnet.reval-sn.id
  #   private_ip_address_allocation = "Dynamic"
  # }
  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = data.azurerm_subnet.reval_subnet.id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = azurerm_public_ip.smbc_public_ip.id
  }
}
