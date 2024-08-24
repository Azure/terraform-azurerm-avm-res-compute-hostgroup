<<<<<<< HEAD
# TODO: insert resources here.
data "azurerm_resource_group" "parent" {
  count = var.location == null ? 1 : 0

  name = var.resource_group_name
}

# TODO: Replace this dummy resource azurerm_resource_group.TODO with your module resource
resource "azurerm_resource_group" "TODO" {
  location = coalesce(var.location, local.resource_group_location)
  name     = var.name # calling code must supply the name
}

# required AVM resources interfaces
resource "azurerm_management_lock" "this" {
  count = var.lock.kind != "None" ? 1 : 0

  lock_level = var.lock.kind
  name       = coalesce(var.lock.name, "lock-${var.name}")
  scope      = azurerm_resource_group.TODO.id # TODO: Replace this dummy resource azurerm_resource_group.TODO with your module resource
}

resource "azurerm_role_assignment" "this" {
  for_each = var.role_assignments

  principal_id                           = each.value.principal_id
  scope                                  = azurerm_resource_group.TODO.id # TODO: Replace this dummy resource azurerm_resource_group.TODO with your module resource
  condition                              = each.value.condition
  condition_version                      = each.value.condition_version
  delegated_managed_identity_resource_id = each.value.delegated_managed_identity_resource_id
  role_definition_id                     = strcontains(lower(each.value.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? each.value.role_definition_id_or_name : null
  role_definition_name                   = strcontains(lower(each.value.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? null : each.value.role_definition_id_or_name
  skip_service_principal_aad_check       = each.value.skip_service_principal_aad_check
}
=======
# Creates the resource group for the dedicated host group
resource "azurerm_resource_group" "this" {
  location = var.location
  name     = var.resource_group_name
  tags     = var.tags
}

# Creates the dedicated host group
resource "azurerm_dedicated_host_group" "this" {
  location                    = azurerm_resource_group.this.location
  name                        = var.dedicated_host_group_name
  platform_fault_domain_count = var.platform_fault_domain_count
  resource_group_name         = azurerm_resource_group.this.name
  automatic_placement_enabled = var.automatic_placement_enabled
  tags                        = var.tags
  zone                        = var.zone
}

# Creates the dedicated host within the dedicated host group
# resource "azurerm_dedicated_host" "example" {
#   name                    = var.dedicated_host_name
#   location                = azurerm_resource_group.this.location
#   dedicated_host_group_id = azurerm_dedicated_host_group.this.id
#   sku_name                = var.dedicated_host_sku_name
#   platform_fault_domain   = var.platform_fault_domain
#   auto_replace_on_failure = var.auto_replace_on_failure
#   license_type            = var.license_type
#   tags                    = var.tags
# }

resource "azurerm_dedicated_host" "this" {
  for_each = var.dedicated_hosts

  dedicated_host_group_id = azurerm_dedicated_host_group.this.id
  location                = azurerm_resource_group.this.location
  name                    = each.value.name
  platform_fault_domain   = each.value.platform_fault_domain
  sku_name                = each.value.sku_name
  auto_replace_on_failure = each.value.auto_replace_on_failure
  license_type            = each.value.license_type
  tags                    = lookup(each.value, "tags", null)
}
>>>>>>> 1932195ddd8055d006cf9e731d7fadd75869c6ad
