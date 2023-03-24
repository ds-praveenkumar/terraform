



# Create Storage Account
resource "azurerm_storage_account" "reval_asa" {
  name                = var.sa_name 
  resource_group_name = var.resource_group_name
  location            = var.location

  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"


  network_rules {
    bypass                     = ["Logging", "Metrics", "AzureServices"]
    default_action             = "Allow"
    virtual_network_subnet_ids = [var.virtual_network_subnet_id]
  }

#   depends_on = [
#     azurerm_virtual_network.reval-vnet,
#     azurerm_subnet.reval-sn
#   ]

}