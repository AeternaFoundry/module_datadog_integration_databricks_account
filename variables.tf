variable "integration_databricks_accounts" {
  description = <<EOT
Map of integration_databricks_accounts, attributes below
Required:
    - authentication
    - name
    - settings
Optional:
    - dataflows
EOT

  type = map(object({
    authentication = object({
      databricks_integration_account_bearer_token_auth = optional(object({
        auth_type        = optional(string)
        token_wo         = optional(string)
        token_wo_version = optional(string)
      }))
      databricks_integration_account_o_auth_auth = optional(object({
        auth_type                = optional(string)
        azure_tenant_id          = optional(string)
        client_id                = string
        client_secret_wo         = string
        client_secret_wo_version = string
      }))
      databricks_integration_account_private_action_runner_auth = optional(object({
        auth_type     = optional(string)
        connection_id = string
        secret_path   = optional(string)
        user_uuid     = string
      }))
    })
    name = string
    settings = object({
      system_tables_sql_warehouse_id = optional(string)
      workspace_url                  = string
    })
    dataflows = optional(object({
      databricks_cloud_cost_metrics = optional(object({
        enabled = optional(bool)
        settings = optional(object({
          ccm_collect_all_workspaces = optional(bool)
        }))
      }))
      databricks_data_observability_jobs_monitoring = optional(object({
        enabled = optional(bool)
        settings = optional(object({
          dd_api_key_id                  = optional(string)
          dd_api_key_secret_wo           = optional(string)
          dd_api_key_secret_wo_version   = optional(string)
          djm_global_init_script_enabled = optional(bool)
          script_gpum_enabled            = optional(bool)
          script_logs_enabled            = optional(bool)
          serverless_jobs_enabled        = optional(bool)
        }))
      }))
      databricks_data_observability_quality_monitoring = optional(object({
        enabled = optional(bool)
        settings = optional(object({
          do_crawlers_cron    = optional(string)
          sync_system_catalog = optional(bool)
        }))
      }))
      databricks_model_serving_metrics = optional(object({
        enabled = optional(bool)
      }))
    }))
  }))
}

