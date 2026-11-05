output "peering_ids" {
  description = "Map of created Virtual Network Peering IDs"
  value       = { for k, v in azurerm_virtual_network_peering.peering : k => v.id }
}
