output "public_ip_ids" {
  description = "Map of created Public IP IDs"
  value       = { for k, v in azurerm_public_ip.pip : k => v.id }
}

output "public_ip_addresses" {
  description = "Map of created Public IP addresses"
  value       = { for k, v in azurerm_public_ip.pip : k => v.ip_address }
}
