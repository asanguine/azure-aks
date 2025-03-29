output "resource_group_name" {
  description = "The name of the Resource Group created for storing Terraform state."
  value       = azurerm_resource_group.tfstate_rg.name
}

output "storage_account_name" {
  description = "The name of the Storage Account created for storing Terraform state."
  value       = azurerm_storage_account.tfstate_sa.name
}

output "storage_container_name" {
  description = "The name of the Storage Container created for storing Terraform state."
  value       = azurerm_storage_container.tfstate_container.name
}
