module "test" {
  source = "../../"
  # source             = "Azure/avm-<res/ptn>-<name>/azurerm"
  enable_telemetry            = local.enable_telemetry # see variables.tf
  resource_group_name         = local.resource_group_name
  location                    = local.location
  dedicated_host_group_name   = local.dedicated_host_group_name
  platform_fault_domain_count = local.platform_fault_domain_count
  automatic_placement_enabled = local.automatic_placement_enabled
  zone                        = local.zone
  tags                        = local.tags
  dedicated_hosts             = local.dedicated_hosts
}
