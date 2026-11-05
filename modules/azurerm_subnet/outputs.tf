output "subnet_ids" {
  description = "Map of created Subnet IDs"
  value       = { for k, v in azurerm_subnet.subnet : k => v.id }
}

output "subnet_names" {
  description = "Map of created Subnet names"
  value       = { for k, v in azurerm_subnet.subnet : k => v.name }
}

output "subnet_prefixes" {
  description = "Map of created Subnet address prefixes"
  value       = { for k, v in azurerm_subnet.subnet : k => v.address_prefixes }
}
