rgs = {
  rg1 = {
    rg_name  = "dev-rg"
    location = "canada central"
  }
}


vnet = {
  vnet1 = {
    vnet_name           = "dev-vnet1"
    location            = "canada central"
    resource_group_name = "dev-rg"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      subnet1 = {
        subnet_name      = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }

      subnet2 = {
        subnet_name      = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}


pip = {
  app1 = {
    pip_name            = "fe_pip"
    resource_group_name = "dev-rg"
    location            = "canada central"
    allocation_method   = "Static"
  }
  app2 = {
    pip_name            = "be_pip"
    resource_group_name = "dev-rg"
    location            = "canada central"
    allocation_method   = "Static"
  }
}


nic = {
  frontend = {
    nic_name             = "nic-dev-fe"
    location             = "canada central"
    resource_group_name  = "dev-rg"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "dev-vnet1"
    pip_name             = "fe_pip"
  }

  backend = {
    nic_name             = "nic-dev-be"
    location             = "canada central"
    resource_group_name  = "dev-rg"
    subnet_name          = "backend-subnet"
    virtual_network_name = "dev-vnet1"
    pip_name             = "be_pip"
  }
}

nsg = {
  frontend = {
    nsg_name             = "nsg-dev-fe"
    location             = "canada central"
    resource_group_name  = "dev-rg"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "dev-vnet1"
  }

  backend = {
    nsg_name             = "nsg-dev-be"
    location             = "canada central"
    resource_group_name  = "dev-rg"
    subnet_name          = "backend-subnet"
    virtual_network_name = "dev-vnet1"
  }
}

vms = {
  frontend = {
    vm_name             = "dev-fe-vm-01"
    resource_group_name = "dev-rg"
    location            = "canada central"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "vkp_user"
    admin_password      = "vkp@12345"
    nic_name            = "nic-dev-fe"
  }

  backend = {
    vm_name             = "dev-be-vm-01"
    resource_group_name = "dev-rg"
    location            = "canada central"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "vkp_user"
    admin_password      = "vkp@12345"
    nic_name            = "nic-dev-be"
  }
}

server = {
  sql_server = {
    server_name                   = "dev-server-01"
    resource_group_name           = "dev-rg"
    location                      = "canada central"
    version                       = "12.0"
    administrator_login           = "vkp_admin"
    administrator_login_password  = "AbCdEfGhIjKlMnOpQrStUvWxYz@12345"
    minimum_tls_version           = "1.2"
    public_network_access_enabled = true
  }
}

db = {
  sql_db = {
    db_name             = "dev-db"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
    server_name         = "dev-server-01"
    resource_group_name = "dev-rg"
  }
}
