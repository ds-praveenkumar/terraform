

resource "azurerm_storage_share" "test_fs" {
  name                 = var.file_share_name
  storage_account_name = data.azurerm_storage_account.sa.name
  quota                = 50

}