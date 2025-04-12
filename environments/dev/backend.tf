terraform {
  backend "azurerm" {
    resource_group_name   = ""
    storage_account_name  = ""
    container_name        = ""      
    key                   = "terraform.tfstate" 
    access_key            = ""
    use_azuread_auth      = true
  }
}
