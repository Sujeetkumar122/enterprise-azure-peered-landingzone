variable "bastions" {
  description = "Map of Azure Bastion hosts to deploy"
  type = map(object({
    name         = string
    location     = string
    rg_name      = string
    subnet_id    = string
    public_ip_id = string
    tags         = optional(map(string), {})
  }))
}
