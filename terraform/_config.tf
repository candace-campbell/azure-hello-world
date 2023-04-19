# AZURE
terraform {
  backend "azurerm" {
    resource_group_name  = "cdc-coe-candace-campbell" # Update with your resource group name
    storage_account_name = "tfstate1candace"          # Update with your storage account name
    container_name       = "tfstate"
    key                  = "azure-hello-world.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true

  subscription_id = "58ff5726-4156-4e39-b50d-ad0ba32ca258"
}
