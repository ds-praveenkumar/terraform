


data "azurerm_resource_group" "resource-group" {
  name = "test-rg"
}

data "local_file" "ps_script" {
  filename = "${path.module}/VMStarStop.PS1"
}

data "azurerm_user_assigned_identity" "test_user" {
  name                = var.user_assigned_id_name
  resource_group_name = data.azurerm_resource_group.resource-group.name
}
