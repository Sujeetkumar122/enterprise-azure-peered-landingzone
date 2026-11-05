variable "subnets" {
  description = "Map of subnets to deploy"
  type = map(object({
    name      = string
    vnet_name = string
    rg_name   = string
    prefix    = string
  }))
}
