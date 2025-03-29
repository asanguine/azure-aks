#https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=terraform

resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "tfstate_rg" {
  name     = "tfstate"
  location = "East US"
}

resource "azurerm_storage_account" "tfstate_sa" {
  name                     = "tfstate${random_string.resource_code.result}"
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tfstate_container" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.tfstate_sa.id
  container_access_type = "private"
}

resource "azurerm_key_vault_secret" "storage_account_access_key" {
  name         = "storage-account-access-key"
  value        = azurerm_storage_account.tfstate_sa.primary_access_key
  key_vault_id = var.key_vault_id
}

# data "azurerm_client_config" "this" {}

# resource "azurerm_role_assignment" "storage_blob_data_contributor" {
#   scope                = module.storage_account.resource_id
#   role_definition_name = "Storage Blob Data Contributor"
#   principal_id         = azurerm_ad_service_principal.terraform_sp.id
# }
