output "vm_ids" {
  description = "Map of created Virtual Machine IDs"
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.id }
}

output "vm_names" {
  description = "Map of created Virtual Machine names"
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.name }
}
