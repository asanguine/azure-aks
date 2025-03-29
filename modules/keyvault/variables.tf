variable "keyvault_name" {
  description = "Name of the Azure Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the Key Vault will be created."
  type        = string
}

variable "region" {
  description = "Azure region where the Key Vault will be deployed."
  type        = string
}

variable "sku_name" {
  type        = string
}

variable "virtual_network_subnet_ids" {
  type = list(string)
}
