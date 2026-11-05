variable "nsgs" {
  description = "Map of network security groups to deploy"
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    tags     = optional(map(string), {})
  }))
}
