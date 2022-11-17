terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

# virtual netwkorking
resource "azurerm_resource_group" "az104_vnet_rg" {
  name     = "az104-04-rg1"
  location = "West Europe"
}