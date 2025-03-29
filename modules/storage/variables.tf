variable "region" {
  type        = string
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "resource group name"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account."
  type        = string
}

variable "tf_state_container_name" {
  description = "Name of the Blob Container to store Terraform state."
  type        = string
}

variable "shared_access_key_enabled" {
  description = "Enable shared key access for the Storage Account."
  type        = bool
  default     = true
}

variable "storage_account_access_key" {
  type = string
}

variable "key_vault_id" {
  type = string
}
