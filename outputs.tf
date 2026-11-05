output "resource_group_ids" {
  description = "IDs of the deployed Resource Groups"
  value       = module.rg.resource_group_ids
}

output "virtual_network_ids" {
  description = "IDs of the deployed Virtual Networks"
  value       = module.vnet.vnet_ids
}

output "subnet_ids" {
  description = "IDs of the deployed Subnets"
  value       = module.subnet.subnet_ids
}

output "peering_ids" {
  description = "IDs of the Virtual Network Peerings"
  value       = module.peering.peering_ids
}

output "bastion_ids" {
  description = "IDs of the deployed Azure Bastion Hosts"
  value       = module.bastions.bastion_ids
}

output "vm_ids" {
  description = "IDs of the deployed Virtual Machines"
  value       = module.vm.vm_ids
}

output "storage_account_ids" {
  description = "IDs of the deployed Storage Accounts"
  value       = module.storage.storage_account_ids
}
