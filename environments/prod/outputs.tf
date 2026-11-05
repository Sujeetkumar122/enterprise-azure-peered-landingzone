output "environment" {
  description = "Target deployment environment"
  value       = var.environment
}

output "resource_group_ids" {
  description = "IDs of the deployed Resource Groups in Prod"
  value       = module.rg.resource_group_ids
}

output "virtual_network_ids" {
  description = "IDs of the deployed Virtual Networks in Prod"
  value       = module.vnet.vnet_ids
}

output "subnet_ids" {
  description = "IDs of the deployed Subnets in Prod"
  value       = module.subnet.subnet_ids
}

output "bastion_ids" {
  description = "IDs of the deployed Azure Bastion Hosts in Prod"
  value       = module.bastions.bastion_ids
}

output "vm_ids" {
  description = "IDs of the deployed Virtual Machines in Prod"
  value       = module.vm.vm_ids
}

output "storage_account_ids" {
  description = "IDs of the deployed Storage Accounts in Prod"
  value       = module.storage.storage_account_ids
}
