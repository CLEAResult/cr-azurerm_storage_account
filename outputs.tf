output "id" {
  value = azurerm_storage_account.storageaccount.*.id
}

output "name" {
  value = azurerm_storage_account.storageaccount.*.name
}

output "primary_location" {
  value = azurerm_storage_account.storageaccount.*.primary_location
}

output "secondary_location" {
  value = azurerm_storage_account.storageaccount.*.secondary_location
}

output "StorageBlobDataContributorId" {
  value = azuread_group.StorageBlobDataContributor.id
}

output "StorageAccountKeyOperatorServiceRoleId" {
  value = azuread_group.StorageAccountKeyOperatorServiceRole.id
}

output "StorageBlobDataContributorName" {
  value = azuread_group.StorageBlobDataContributor.name
}

output "StorageAccountKeyOperatorServiceRoleName" {
  value = azuread_group.StorageAccountKeyOperatorServiceRole.name
}

output "account_kind" {
  value = azurerm_storage_account.storageaccount.*.account_kind
}

output "account_tier" {
  value = azurerm_storage_account.storageaccount.*.account_tier
}

output "account_replication_type" {
  value = azurerm_storage_account.storageaccount.*.account_replication_type
}

output "access_tier" {
  value = azurerm_storage_account.storageaccount.*.access_tier
}

output "enable_blob_encryption" {
  value = azurerm_storage_account.storageaccount.*.enable_blob_encryption
}

output "enable_file_encryption" {
  value = azurerm_storage_account.storageaccount.*.enable_file_encryption
}

output "enable_https_traffic_only" {
  value = azurerm_storage_account.storageaccount.*.enable_https_traffic_only
}

output "primary_blob_endpoint" {
  value = azurerm_storage_account.storageaccount.*.primary_blob_endpoint
}

output "primary_blob_host" {
  value = azurerm_storage_account.storageaccount.*.primary_blob_host
}

output "primary_queue_endpoint" {
  value = azurerm_storage_account.storageaccount.*.primary_queue_endpoint
}

output "primary_queue_host" {
  value = azurerm_storage_account.storageaccount.*.primary_queue_host
}

output "primary_table_endpoint" {
  value = azurerm_storage_account.storageaccount.*.primary_table_endpoint
}

output "primary_table_host" {
  value = azurerm_storage_account.storageaccount.*.primary_table_host
}

output "primary_file_endpoint" {
  value = azurerm_storage_account.storageaccount.*.primary_file_endpoint
}

output "primary_file_host" {
  value = azurerm_storage_account.storageaccount.*.primary_file_host
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.storageaccount.*.primary_web_endpoint
}

output "primary_web_host" {
  value = azurerm_storage_account.storageaccount.*.primary_web_host
}

