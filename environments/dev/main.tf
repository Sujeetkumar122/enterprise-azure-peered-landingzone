# ==============================================================================
# Development Environment - Enterprise Deployment
# Calls child modules from ../../modules/
# ==============================================================================

# 1. Resource Groups
module "rg" {
  source = "../../modules/azurerm_resource_group"

  resource_groups = var.resource_groups
}

# 2. Virtual Networks
module "vnet" {
  source     = "../../modules/azurerm_virtual_network"
  depends_on = [module.rg]

  vnets = {
    for k, v in var.vnets : k => {
      name          = v.name
      rg_name       = module.rg.resource_group_names[v.rg_key]
      location      = module.rg.resource_group_locations[v.rg_key]
      address_space = v.address_space
      tags          = v.tags
    }
  }
}

# 3. Subnets (Workload & AzureBastionSubnet)
module "subnet" {
  source     = "../../modules/azurerm_subnet"
  depends_on = [module.vnet]

  subnets = {
    for k, v in var.subnets : k => {
      name      = v.name
      vnet_name = module.vnet.vnet_names[v.vnet_key]
      rg_name   = module.rg.resource_group_names[v.rg_key]
      prefix    = v.prefix
    }
  }
}

# 4. Network Security Groups
module "nsg" {
  source     = "../../modules/azurerm_network_security_group"
  depends_on = [module.rg]

  nsgs = {
    for k, v in var.nsgs : k => {
      name     = v.name
      rg_name  = module.rg.resource_group_names[v.rg_key]
      location = module.rg.resource_group_locations[v.rg_key]
      tags     = v.tags
    }
  }
}

# 5. Public IPs (Standard Static for Bastion)
module "public_ip" {
  source     = "../../modules/azurerm_public_ip"
  depends_on = [module.rg]

  public_ips = {
    for k, v in var.public_ips : k => {
      name              = v.name
      location          = module.rg.resource_group_locations[v.rg_key]
      rg_name           = module.rg.resource_group_names[v.rg_key]
      allocation_method = v.allocation_method
      sku               = v.sku
      tags              = v.tags
    }
  }
}

# 6. Azure Bastion Host
module "bastions" {
  source     = "../../modules/azurerm_bastion_host"
  depends_on = [module.subnet, module.public_ip]

  bastions = {
    for k, v in var.bastions : k => {
      name         = v.name
      location     = module.rg.resource_group_locations[v.rg_key]
      rg_name      = module.rg.resource_group_names[v.rg_key]
      subnet_id    = module.subnet.subnet_ids[v.subnet_key]
      public_ip_id = module.public_ip.public_ip_ids[v.pip_key]
      tags         = v.tags
    }
  }
}

# 7. Network Interfaces
module "nic" {
  source     = "../../modules/azurerm_network_interface"
  depends_on = [module.subnet]

  network_interfaces = {
    for k, v in var.network_interfaces : k => {
      name                          = v.name
      location                      = module.rg.resource_group_locations[v.rg_key]
      rg_name                       = module.rg.resource_group_names[v.rg_key]
      subnet_id                     = module.subnet.subnet_ids[v.subnet_key]
      private_ip_address_allocation = v.private_ip_address_allocation
      tags                          = v.tags
    }
  }
}

# 8. Virtual Machines
module "vm" {
  source     = "../../modules/azurerm_virtual_machine"
  depends_on = [module.nic]

  virtual_machines = {
    for k, v in var.virtual_machines : k => {
      name                 = v.name
      location             = module.rg.resource_group_locations[v.rg_key]
      resource_group_name  = module.rg.resource_group_names[v.rg_key]
      size                 = v.size
      admin_username       = v.admin_username
      admin_password       = v.admin_password
      network_interface_id = module.nic.nic_ids[v.nic_key]
      os_disk_caching      = v.os_disk_caching
      storage_account_type = v.storage_account_type
      image_publisher      = v.image_publisher
      image_offer          = v.image_offer
      image_sku            = v.image_sku
      image_version        = v.image_version
      tags                 = v.tags
    }
  }
}

# 9. Storage Accounts
module "storage" {
  source     = "../../modules/azurerm_storage_account"
  depends_on = [module.rg]

  storage_accounts = {
    for k, v in var.storage_accounts : k => {
      name                     = v.name
      resource_group_name      = module.rg.resource_group_names[v.rg_key]
      location                 = module.rg.resource_group_locations[v.rg_key]
      account_tier             = v.account_tier
      account_replication_type = v.account_replication_type
      min_tls_version          = v.min_tls_version
      tags                     = v.tags
    }
  }
}
