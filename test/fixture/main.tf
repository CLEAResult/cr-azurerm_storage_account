provider "azurerm" {
  version         = "1.30.1"
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
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
  create_msi               = true
}

# Create a container in the new storage account as test validation
resource "azurerm_storage_container" "test" {
  name                  = "vhds"
  resource_group_name   = azurerm_resource_group.rg.name
  storage_account_name  = basename(module.storage.id[0])
  container_access_type = "private"
}

