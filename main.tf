terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.52.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "random_id" "state_id" {
  keepers = {
    state_id = var.state_id_seed
  }

  byte_length = 8
}

resource "azurerm_resource_group" "state_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = local.tags
}

resource "azurerm_storage_account" "state_sa" {
  name                     = "${var.storage_account_prefix}${random_id.state_id.hex}"
  resource_group_name      = azurerm_resource_group.state_rg.name
  location                 = azurerm_resource_group.state_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "BlobStorage"

  tags = local.tags
}

resource "azurerm_storage_container" "state_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.state_sa.name
}
