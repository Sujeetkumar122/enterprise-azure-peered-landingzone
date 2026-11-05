output "storage_account_ids" {
  description = "Map of created Storage Account IDs"
  value       = { for k, v in azurerm_storage_account.storage : k => v.id }
}

output "primary_blob_endpoints" {
  description = "Map of created Storage Account primary blob endpoints"
  value       = { for k, v in azurerm_storage_account.storage : k => v.primary_blob_endpoint }
}
