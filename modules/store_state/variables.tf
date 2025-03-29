variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "environment" {
  description = "The environment for tagging purposes (e.g., dev, prod)."
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Azure Key Vault where the secret will be stored."
  type = string
}
