resource "datadog_integration_databricks_account" "integration_databricks_accounts" {
  for_each = var.integration_databricks_accounts

  authentication = each.value.authentication
  name           = each.value.name
  settings       = each.value.settings
  dataflows      = each.value.dataflows
}

