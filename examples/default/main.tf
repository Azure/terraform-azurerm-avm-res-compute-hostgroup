# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.3.0"
}

# This is the module call
module "test" {
  source = "../../"
  # source             = "Azure/avm-<res/ptn>-<name>/azurerm"
  enable_telemetry            = local.enable_telemetry # see variables.tf
  resource_group_name         = module.naming.resource_group.name_unique
  location                    = local.location
  dedicated_host_group_name   = local.dedicated_host_group_name
  platform_fault_domain_count = local.platform_fault_domain_count
  automatic_placement_enabled = local.automatic_placement_enabled
  zone                        = local.zone
  tags                        = local.tags
  dedicated_hosts             = local.dedicated_hosts
}
