output "keyvault_id" {
  description = "The ID of the Azure Key Vault."
  value       = module.keyvault.resource_id
}

output "keyvault_uri" {
  description = "The URI of the Azure Key Vault."
  value       = module.keyvault.uri
}
