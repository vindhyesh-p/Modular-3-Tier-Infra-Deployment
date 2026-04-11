terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.67.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "rg-terraform-state"
    storage_account_name = "stterraformstate11"
    container_name       = "tfstate"
    key = "dev.tfstate"
  }
}


provider "azurerm" {
    features {}
    subscription_id = "c3e6fe0d-eb49-418b-818b-3139e1e47023"  
}
