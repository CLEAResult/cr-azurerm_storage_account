resource "azurerm_storage_account" "storageaccount" {
  name                      = "${local.name}${format("%03d", count.index + 1)}"
  count                     = "${var.count}"
  resource_group_name       = "${var.rg_name}"
  location                  = "${var.location}"
  enable_https_traffic_only = "${var.enable_https_traffic_only}"
  account_kind              = "${var.account_kind}"
  access_tier               = "${var.access_tier}"
  account_replication_type  = "${var.account_replication_type}"
  account_tier              = "${var.account_tier}"

  tags = {
    InfrastructureAsCode = "True"
  }
}

resource "azuread_group" "StorageAccountKeyOperatorServiceRole" {
  name = "g${local.default_rgid}${local.env_id}${local.rg_type}_AZ_AStorageAccountKeyOperatorServiceRole"
}

resource "azuread_group" "StorageBlobDataContributor" {
  name = "g${local.default_rgid}${local.env_id}${local.rg_type}_AZ_StorageBlobDataContributor"
}

resource "azurerm_role_assignment" "StorageAccountKeyOperatorServiceRole" {
  scope                = "/subscriptions/${var.subscription_id}/resourceGroups/${var.rg_name}"
  role_definition_name = "Storage Account Key Operator Service Role"
  principal_id         = "${azuread_group.StorageAccountKeyOperatorServiceRole.id}"
}

resource "azurerm_role_assignment" "StorageBlobDataContributor" {
  scope                = "/subscriptions/${var.subscription_id}/resourceGroups/${var.rg_name}"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = "${azuread_group.StorageBlobDataContributor.id}"
}
