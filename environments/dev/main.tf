module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs = var.rgs
}

module "vnet" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_virtual_network"
  vnet = var.vnet
}

module "public_ip" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_public_ip"
  pip = var.pip
}

module "nic" {
  depends_on = [ module.rg, module.vnet, module.public_ip ]
  source = "../../modules/azurerm_nic"
  nic = var.nic
}

module "nsg" {
  depends_on = [module.rg, module.vnet]
  source = "../../modules/azurerm_nsg"
  nsg = var.nsg
}

# module "key_vault" {
#   depends_on = [ module.rg ]
#   source = "../../modules/azurerm_key_vault"
#   key_vaults = var.key_vaults
# }

# module "key_vault_secret" {
#   depends_on = [ module.rg, module.key_vault ]
#   source = "../../modules/azurerm_key_vault_secret"
#   kvs = var.kvs
# }

module "vm" {
    depends_on = [ module.rg ,module.vnet,module.nic,module.nsg,module.public_ip]
    source = "../../modules/azurerm_virtual_machine"  
    vms = var.vms
}

module "sql_db" {
  depends_on = [ module.sql_server ]
  source = "../../modules/azurerm_sql_database"
  db = var.db
}

module "sql_server" {
  source = "../../modules/azurerm_sql_server"
  server = var.server
}