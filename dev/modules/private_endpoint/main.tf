

# Create Private Endpoint
resource "azurerm_private_endpoint" "endpoint" {
  name                = var.pvt_end_point_name
  resource_group_name = data.azurerm_resource_group.resource-group.name #azurerm_resource_group.network-rg.name
  location            = var.location
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.pvc_name
    private_connection_resource_id = data.azurerm_storage_account.sa.id
    is_manual_connection           = false
    subresource_names              = ["file"]
  }

}
