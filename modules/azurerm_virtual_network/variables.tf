variable "vnets" {
  description = "Map of virtual networks to deploy"
  type = map(object({
    name          = string
    rg_name       = string
    location      = string
    address_space = list(string)
    tags          = optional(map(string), {})
  }))
}
