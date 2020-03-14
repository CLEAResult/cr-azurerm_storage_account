provider "azurerm" {
  version         = "2.1.0"
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg" {
  name     = format("rg-%s", random_string.suffix.result)
  location = var.location
}

module "storage" {
  source                   = "../../"
  rgid                     = var.rgid
  environment              = var.environment
  location                 = var.location
  subscription_id          = var.subscription_id
  tenant_id                = var.tenant_id
  rg_name                  = azurerm_resource_group.rg.name
  account_replication_type = "LRS"
  create_msi               = false
}

module "storage-msi" {
  source                   = "../../"
  rgid                     = var.rgid
  environment              = var.environment
  location                 = var.location
  subscription_id          = var.subscription_id
  tenant_id                = var.tenant_id
  name_prefix              = format("%s2", random_string.suffix.result)
  rg_name                  = azurerm_resource_group.rg.name
  account_replication_type = "LRS"
  create_msi               = true
}

