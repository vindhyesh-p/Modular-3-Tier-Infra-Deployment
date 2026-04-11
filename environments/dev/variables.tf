variable "rgs" {
  type = map(object({
    rg_name  = string
    location = string
  }))
}

variable "vnet" {
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = optional(map(object({
      subnet_name      = string
      address_prefixes = list(string)
    })), {})
  }))
}

variable "pip" {}

# variable "pip" {
#   type = map(object({
#     pip_name                = string
#     resource_group_name = string
#     location            = string
#     allocation_method   = string
#   }))
# }

variable "nic" {
  type = map(object({
    nic_name             = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
    pip_name             = string
  }))
}

variable "nsg" {
  type = map(object({
    nsg_name             = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
  }))
}

# variable "key_vaults" {
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#   }))
# }

# variable "kvs" {
#   type = map(object({
#     kvs_name            = string
#     kvs_value           = string
#     kv_name             = string
#     resource_group_name = string
#   }))
# }

variable "vms" {
  type = map(object({
    vm_name             = string
    resource_group_name = string
    location            = string
    vm_size             = string
    admin_username      = string
    admin_password      = string
    nic_name            = string
  }))
}

variable "server" {
  type = map(object({
    server_name                   = string
    resource_group_name           = string
    location                      = string
    version                       = string
    administrator_login           = string
    administrator_login_password  = string
    minimum_tls_version           = string
    public_network_access_enabled = bool
  }))
}

variable "db" {
    type = map(object({
        db_name         = string
  collation    = string
  license_type = string
  max_size_gb  = number
  sku_name     = string
  enclave_type = string
  server_name = string
  resource_group_name = string
    }))
}