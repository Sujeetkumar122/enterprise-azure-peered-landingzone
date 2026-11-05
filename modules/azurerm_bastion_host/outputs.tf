output "bastion_ids" {
  description = "Map of created Bastion Host IDs"
  value       = { for k, v in azurerm_bastion_host.bastion : k => v.id }
}

output "bastion_dns_names" {
  description = "Map of created Bastion Host DNS names"
  value       = { for k, v in azurerm_bastion_host.bastion : k => v.dns_name }
}
