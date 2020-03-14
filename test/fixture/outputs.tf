output "id" {
  value = module.storage.*.id
}

output "name" {
  value = module.storage.*.name
}

output "primary_location" {
  value = module.storage.*.primary_location
}

output "secondary_location" {
  value = module.storage.*.secondary_location
}

output "StorageBlobDataContributorId" {
  value = module.storage.StorageBlobDataContributorId
}

output "StorageAccountKeyOperatorServiceRoleId" {
  value = module.storage.StorageAccountKeyOperatorServiceRoleId
}

output "StorageBlobDataContributorName" {
  value = module.storage.StorageBlobDataContributorName
}

output "StorageAccountKeyOperatorServiceRoleName" {
  value = module.storage.StorageAccountKeyOperatorServiceRoleName
}

output "account_kind" {
  value = module.storage.*.account_kind
}

output "account_tier" {
  value = module.storage.*.account_tier
}

output "account_replication_type" {
  value = module.storage.*.account_replication_type
}

output "access_tier" {
  value = module.storage.*.access_tier
}

output "enable_https_traffic_only" {
  value = module.storage.*.enable_https_traffic_only
}

output "primary_blob_endpoint" {
  value = module.storage.*.primary_blob_endpoint
}

output "primary_blob_host" {
  value = module.storage.*.primary_blob_host
}

output "primary_queue_endpoint" {
  value = module.storage.*.primary_queue_endpoint
}

output "primary_queue_host" {
  value = module.storage.*.primary_queue_host
}

output "primary_table_endpoint" {
  value = module.storage.*.primary_table_endpoint
}

output "primary_table_host" {
  value = module.storage.*.primary_table_host
}

output "primary_file_endpoint" {
  value = module.storage.*.primary_file_endpoint
}

output "primary_file_host" {
  value = module.storage.*.primary_file_host
}

output "primary_web_endpoint" {
  value = module.storage.*.primary_web_endpoint
}

output "primary_web_host" {
  value = module.storage.*.primary_web_host
}

output "primary_access_key" {
  value = module.storage.*.primary_access_key
}

output "secondary_access_key" {
  value = module.storage.*.secondary_access_key
}

output "primary_connection_string" {
  value = module.storage.*.primary_connection_string
}

output "secondary_connection_string" {
  value = module.storage.*.secondary_connection_string
}

output "primary_blob_connection_string" {
  value = module.storage.*.primary_blob_connection_string
}

output "secondary_blob_connection_string" {
  value = module.storage.*.secondary_blob_connection_string
}

output "msi_principal_id" {
  value = module.storage.*.msi_principal_id
}

output "msi_tenant_id" {
  value = module.storage.*.msi_tenant_id
}

