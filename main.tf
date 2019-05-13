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
