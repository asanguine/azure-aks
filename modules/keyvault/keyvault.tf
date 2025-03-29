data "azurerm_client_config" "this" {}

data "http" "my_ip" {
  url = "https://ifconfig.me/ip"
}

# resource "azurerm_role_assignment" "keyvault_secrets_officer" {
#   scope                = module.keyvault.resource_id
#   role_definition_name = "Key Vault Secrets Officer"
#   principal_id         = azurerm_ad_service_principal.terraform_sp.id
# }

module "keyvault" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"

  name                = var.keyvault_name
  resource_group_name = var.resource_group_name
  location            = var.region
  tenant_id           = data.azurerm_client_config.this.tenant_id
  sku_name            = var.sku_name

  network_acls = {
    bypass = "None"
    default_action = "Deny"
    ip_rules = ["${trimspace(tostring(data.http.my_ip.body))}/32"]
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }
}
