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
