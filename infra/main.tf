terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

#-------------------------------------------------------------

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    # preventing deletion of resource group if the rg contains resources
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    # requesting a graceful shutdown and ensuring os disk is deleted on deletion of vm resource
    virtual_machine {
      delete_os_disk_on_deletion = true
      graceful_shutdown          = true
    }
  }

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

# virtual netwkorking
resource "azurerm_resource_group" "az104_vnet_rg" {
  name     = "${local.resource_prefix}rg1"
  location = "West Europe"

  tags = local.common_tags
}

#-------------------------------------------------------------
