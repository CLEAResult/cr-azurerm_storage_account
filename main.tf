# Version constraint required as of 6 June 2019
# Ref: https://github.com/hashicorp/terraform/issues/21235
provider "azuread" {
  version = "= 0.3.1"
  use_msi = var.use_msi
}

resource "azurerm_storage_account" "storageaccount" {
  name                      = format("%s%03d", local.name, count.index + 1)
  count                     = var.num
  resource_group_name       = var.rg_name
  location                  = var.location
  enable_https_traffic_only = true
  enable_blob_encryption    = true
  enable_file_encryption    = true
  account_kind              = var.account_kind
  access_tier               = var.access_tier
  account_replication_type  = var.account_replication_type
  account_tier              = var.account_tier

  tags = {
    InfrastructureAsCode = "True"
  }
}

resource "azuread_group" "StorageAccountKeyOperatorServiceRole" {
  name = format("g%s%s%s_AZ_StorageAccountKeyOperatorServiceRole", local.default_rgid, local.env_id, local.rg_type)
}

resource "azuread_group" "StorageBlobDataContributor" {
  name = format("g%s%s%s_AZ_StorageBlobDataContributor", local.default_rgid, local.env_id, local.rg_type)
}

data "azurerm_subscription" "primary" {}

resource "azurerm_role_assignment" "StorageAccountKeyOperatorServiceRole" {
  scope                = format("%s/resourceGroups/%s", data.azurerm_subscription.primary.id, var.rg_name)
  role_definition_name = "Storage Account Key Operator Service Role"
  principal_id         = azuread_group.StorageAccountKeyOperatorServiceRole.id
}

resource "azurerm_role_assignment" "StorageBlobDataContributor" {
  scope                = format("%s/resourceGroups/%s", data.azurerm_subscription.primary.id, var.rg_name)
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_group.StorageBlobDataContributor.id
}

