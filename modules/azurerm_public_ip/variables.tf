variable "public_ips" {
  description = "Map of public IP addresses to create"
  type = map(object({
    name              = string
    location          = string
    rg_name           = string
    allocation_method = string
    sku               = optional(string, "Standard")
    tags              = optional(map(string), {})
  }))
}
