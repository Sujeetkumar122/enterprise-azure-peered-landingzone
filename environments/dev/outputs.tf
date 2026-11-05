output "environment" {
  description = "Target deployment environment"
  value       = var.environment
}

output "resource_group_ids" {
  description = "IDs of the deployed Resource Groups in Dev"
  value       = module.rg.resource_group_ids
}

output "virtual_network_ids" {
  description = "IDs of the deployed Virtual Networks in Dev"
  value       = module.vnet.vnet_ids
}

output "subnet_ids" {
  description = "IDs of the deployed Subnets in Dev"
  value       = module.subnet.subnet_ids
}

output "bastion_ids" {
  description = "IDs of the deployed Azure Bastion Hosts in Dev"
  value       = module.bastions.bastion_ids
}

output "vm_ids" {
  description = "IDs of the deployed Virtual Machines in Dev"
  value       = module.vm.vm_ids
}

output "storage_account_ids" {
  description = "IDs of the deployed Storage Accounts in Dev"
  value       = module.storage.storage_account_ids
}
