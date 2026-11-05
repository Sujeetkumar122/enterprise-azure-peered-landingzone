output "nsg_ids" {
  description = "Map of created Network Security Group IDs"
  value       = { for k, v in azurerm_network_security_group.nsg : k => v.id }
}

output "nsg_names" {
  description = "Map of created Network Security Group names"
  value       = { for k, v in azurerm_network_security_group.nsg : k => v.name }
}
