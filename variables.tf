variable "rgid" {
  description = "RGID used for naming"
}

variable "location" {
  default     = "southcentralus"
  description = "Location for resources to be created"
}

variable "name_prefix" {
  default     = ""
  description = "Allows users to override the standard naming prefix.  If left as an empty string, the standard naming conventions will apply."
}

variable "num" {
  default     = 1
  description = "The number of storage account resources to create."
}

variable "environment" {
  default     = "dev"
  description = "Environment used in naming lookups"
}

variable "rg_name" {
  description = "Default resource group name that the database will be created in."
}

variable "account_kind" {
  default     = "StorageV2"
  description = "Valid values are:  Storage,BlobStorage,StorageV2"
}

variable "account_tier" {
  default     = "Standard"
  description = "Valid values are:  Standard,Premium"
}

variable "account_replication_type" {
  default     = "LRS"
  description = "Valid values are: LRS, ZRS, GRS, RAGRS"
}

variable "access_tier" {
  default     = "cool"
  description = "Valid values are: Cool, Hot"
}

variable "subscription_id" {
  description = "Prompt for subscription ID"
}

variable "tenant_id" {
  description = "Prompt for tenant ID"
}

# Compute default name values
locals {
  env_id = lookup(module.naming.env-map, var.environment, "env")
  type   = lookup(module.naming.type-map, "azurerm_storage_account", "typ")

  rg_type = lookup(module.naming.type-map, "azurerm_resource_group", "typ")

  default_rgid        = var.rgid != "" ? var.rgid : "norgid"
  default_name_prefix = format("c%s%s", local.default_rgid, local.env_id)

  name_prefix = var.name_prefix != "" ? var.name_prefix : local.default_name_prefix
  name        = format("%s%s", local.name_prefix, local.type)
}

# This module provides a data map output to lookup naming standard references
module "naming" {
  source = "git::https://github.com/CLEAResult/cr-azurerm-naming.git?ref=v1.1.0"
}

