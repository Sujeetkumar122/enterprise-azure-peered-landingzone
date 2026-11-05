variable "storage_accounts" {
  description = "Map of Storage Accounts to deploy"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    min_tls_version          = optional(string, "TLS1_2")
    tags                     = optional(map(string), {})
  }))
}
