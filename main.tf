# Creates the dedicated host group
resource "azurerm_dedicated_host_group" "example" {
  name                        = var.dedicated_host_group_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  platform_fault_domain_count = var.platform_fault_domain_count
  automatic_placement_enabled = var.automatic_placement_enabled
  zone                        = var.zone
  tags                        = var.tags
}

# Creates the dedicated host within the dedicated host group
resource "azurerm_dedicated_host" "example" {
  name                    = var.dedicated_host_name
  location                = azurerm_resource_group.example.location
  dedicated_host_group_id = azurerm_dedicated_host_group.example.id
  sku_name                = var.dedicated_host_sku_name
  platform_fault_domain   = var.platform_fault_domain
  auto_replace_on_failure = var.auto_replace_on_failure
  license_type            = var.license_type
  tags                    = var.tags
}