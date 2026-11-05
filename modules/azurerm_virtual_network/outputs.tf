output "vnet_ids" {
  description = "Map of created Virtual Network IDs"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.id }
}

output "vnet_names" {
  description = "Map of created Virtual Network names"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.name }
}

output "vnet_address_spaces" {
  description = "Map of created Virtual Network address spaces"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.address_space }
}
