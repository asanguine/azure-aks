output "storage_account_name" {
  description = "Name of the created Azure Storage Account."
  value       = module.storage_account.name
}

output "storage_account_id" {
  description = "ID of the created Azure Storage Account."
  value       = module.storage_account.resource_id
}

# output "tf_state_container_name" {
#   description = "Name of the Blob Container for Terraform state."
#   value       = module.storage_account.containers.tfstate.name
# }

output "tf_state_container_id" {
  description = "ID of the Blob Container for Terraform state."
  value       = module.storage_account.containers.tfstate.id
}

output "storage_account_primary_access_key" {
  value = module.storage_account.resource.primary_access_key
  sensitive = true
}

output "storage_account_access_key_secret_uri" {
  description = "The URI of the secret containing the Storage Account access key."
  value       = azurerm_key_vault_secret.storage_account_access_key.id
}
