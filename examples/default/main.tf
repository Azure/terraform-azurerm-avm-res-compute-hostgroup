# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.3.0"
}

# This is the module call
module "test" {
  source = "../../"

  dedicated_host_group_name   = local.dedicated_host_group_name
  location                    = local.location
  platform_fault_domain_count = local.platform_fault_domain_count
  resource_group_name         = module.naming.resource_group.name_unique
  automatic_placement_enabled = local.automatic_placement_enabled
  dedicated_hosts             = local.dedicated_hosts
  # source             = "Azure/avm-<res/ptn>-<name>/azurerm"
  enable_telemetry = local.enable_telemetry # see variables.tf
  tags             = local.tags
  zone             = local.zone
}
