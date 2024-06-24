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