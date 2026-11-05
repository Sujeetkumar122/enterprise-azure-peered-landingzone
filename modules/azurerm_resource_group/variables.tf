variable "resource_groups" {
  description = "Map of resource groups to deploy"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
}
