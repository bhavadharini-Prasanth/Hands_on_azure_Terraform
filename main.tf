terraform {
  required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = ">= 3.43.0"
  }
}
}
provider "azurerm" {
    features {}
    
}
resource "azurerm_resource_group" "rg" {
    name = "813-5f7dff99-hands-on-with-terraform-on-azure"
    location = "West US"
}
module "securestorage" {
  source  = "app.terraform.io/TrainingAzureTerraform/securestorage/azurerm"
  version = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "StorageAzure123hands"
}