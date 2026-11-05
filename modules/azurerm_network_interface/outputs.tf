output "nic_ids" {
  description = "Map of created Network Interface IDs"
  value       = { for k, v in azurerm_network_interface.nic : k => v.id }
}

output "nic_private_ip_addresses" {
  description = "Map of created Network Interface private IP addresses"
  value       = { for k, v in azurerm_network_interface.nic : k => v.private_ip_address }
}
