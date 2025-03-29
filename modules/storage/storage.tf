module "storage_account" {
  source  = "Azure/avm-res-storage-storageaccount/azurerm"

  location                 = var.region
  resource_group_name      = var.resource_group_name
  name                     = var.storage_account_name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  shared_access_key_enabled = var.shared_access_key_enabled

  containers = {
    tfstate = {
      name               = var.tf_state_container_name
      public_access      = "None"
      metadata           = {}
      default_encryption_scope = ""
      deny_encryption_scope_override = false
    }
  }
}

resource "azurerm_key_vault_secret" "storage_account_access_key" {
  name         = var.storage_account_access_key
  value        = module.storage_account.resource.primary_access_key
  key_vault_id = var.key_vault_id
}

# data "azurerm_client_config" "this" {}

# resource "azurerm_role_assignment" "storage_blob_data_contributor" {
#   scope                = module.storage_account.resource_id
#   role_definition_name = "Storage Blob Data Contributor"
#   principal_id         = azurerm_ad_service_principal.terraform_sp.id
# }
