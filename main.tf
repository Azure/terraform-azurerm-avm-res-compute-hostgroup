
resource "azurerm_dedicated_host_group" "example" {
  name                        = var.dedicated_host_group_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  platform_fault_domain_count = var.platform_fault_domain_count
  automatic_placement_enabled = var.automatic_placement_enabled
  zone                        = var.zone
  tags                        = var.tags
}