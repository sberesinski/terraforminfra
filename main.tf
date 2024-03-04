terraform {
  required_version = ">=1.3.0"
  required_providers {
    azurerm = {
      "source" = "hashicorp/azurerm"
      version  = ">=3.43.0"
    }
  }
  cloud {
    organization = "SebastianB"

    workspaces {
      name = "handsonlab"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-c1b7ecdf-hands-on-with-terraform-on-azure"
  location = "East US"

}

module "securestorageaccount" {
  source  = "app.terraform.io/SebastianB/securestorageaccount/azurerm"
  version = "1.0.0"
  # insert required variables here
  resource_group_name      = azurerm_resource_group.rg.name
  storage_account_name     = "stsb151560204"
  account_replication_type = "LRS"
  location                 = azurerm_resource_group.rg.location

}
