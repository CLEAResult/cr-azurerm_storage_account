output "storage_account_name" {
  value = ["${azurerm_storage_account.storageaccount.*.name}"]
}

output "StorageBlobDataContributorId" {
  value = ["${azuread_group.StorageBlobDataContributor.*.id}"]
}

output "StorageAccountKeyOperatorServiceRoleId" {
  value = ["${azuread_group.StorageAccountKeyOperatorServiceRole.*.id}"]
}

output "StorageBlobDataContributorName" {
  value = ["${azuread_group.StorageBlobDataContributor.*.name}"]
}

output "StorageAccountKeyOperatorServiceRoleName" {
  value = ["${azuread_group.StorageAccountKeyOperatorServiceRole.*.name}"]
}

