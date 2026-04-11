# resource "azurerm_key_vault_secret" "kvs" {
#     for_each = var.kvs
#   name         = each.value.kvs_name
#   value        = each.value.kvs_value
#   key_vault_id = data.azurerm_key_vault.kv.id
# }




# data "azurerm_key_vault" "kv" {
#     for_each = var.kvs
#   name                = each.value.kv_name
#   resource_group_name = each.value.resource_group_name
# }