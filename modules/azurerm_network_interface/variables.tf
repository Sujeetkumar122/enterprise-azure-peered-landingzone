variable "network_interfaces" {
  description = "Map of network interfaces to create"
  type = map(object({
    name                          = string
    location                      = string
    rg_name                       = string
    subnet_id                     = string
    private_ip_address_allocation = optional(string, "Dynamic")
    tags                          = optional(map(string), {})
  }))
}
