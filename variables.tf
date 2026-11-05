variable "resource_groups" {
  description = "Map of resource groups to deploy"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
}

variable "vnets" {
  description = "Map of virtual networks to deploy"
  type = map(object({
    name          = string
    rg_key        = string
    address_space = list(string)
    tags          = optional(map(string), {})
  }))
}

variable "subnets" {
  description = "Map of subnets to deploy"
  type = map(object({
    name     = string
    vnet_key = string
    rg_key   = string
    prefix   = string
  }))
}

variable "nsgs" {
  description = "Map of network security groups to deploy"
  type = map(object({
    name   = string
    rg_key = string
    tags   = optional(map(string), {})
  }))
  default = {}
}

variable "peerings" {
  description = "Map of virtual network peerings to configure"
  type = map(object({
    name            = string
    source_vnet_key = string
    remote_vnet_key = string
    source_rg_key   = string
  }))
  default = {}
}

variable "public_ips" {
  description = "Map of public IP addresses to create"
  type = map(object({
    name              = string
    rg_key            = string
    allocation_method = string
    sku               = optional(string, "Standard")
    tags              = optional(map(string), {})
  }))
  default = {}
}

variable "bastions" {
  description = "Map of Azure Bastion hosts to deploy"
  type = map(object({
    name       = string
    rg_key     = string
    subnet_key = string
    pip_key    = string
    tags       = optional(map(string), {})
  }))
  default = {}
}

variable "network_interfaces" {
  description = "Map of network interfaces for virtual machines"
  type = map(object({
    name                          = string
    rg_key                        = string
    subnet_key                    = string
    private_ip_address_allocation = optional(string, "Dynamic")
    tags                          = optional(map(string), {})
  }))
  default = {}
}

variable "virtual_machines" {
  description = "Map of Linux virtual machines to deploy"
  type = map(object({
    name                 = string
    rg_key               = string
    size                 = string
    admin_username       = string
    admin_password       = string
    nic_key              = string
    os_disk_caching      = optional(string, "ReadWrite")
    storage_account_type = optional(string, "Standard_LRS")
    image_publisher      = optional(string, "Canonical")
    image_offer          = optional(string, "0001-com-ubuntu-server-jammy")
    image_sku            = optional(string, "22_04-lts")
    image_version        = optional(string, "latest")
    tags                 = optional(map(string), {})
  }))
  default = {}
}

variable "storage_accounts" {
  description = "Map of storage accounts to deploy"
  type = map(object({
    name                     = string
    rg_key                   = string
    account_tier             = string
    account_replication_type = string
    min_tls_version          = optional(string, "TLS1_2")
    tags                     = optional(map(string), {})
  }))
  default = {}
}
