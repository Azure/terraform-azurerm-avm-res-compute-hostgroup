<<<<<<< HEAD
terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0, < 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0, < 4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}


## Section to provide a random Azure region for the resource group
# This allows us to randomize the region for the resource group.
module "regions" {
  source  = "Azure/regions/azurerm"
  version = ">= 0.3.0"
}

# This allows us to randomize the region for the resource group.
resource "random_integer" "region_index" {
  max = length(module.regions.regions) - 1
  min = 0
}
## End of section to provide a random Azure region for the resource group

# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = ">= 0.3.0"
}

# This is required for resource modules
resource "azurerm_resource_group" "this" {
  location = module.regions.regions[random_integer.region_index.result].name
  name     = module.naming.resource_group.name_unique
=======
# This ensures we have unique CAF compliant names for our resources.
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.3.0"
>>>>>>> 1932195ddd8055d006cf9e731d7fadd75869c6ad
}

# This is the module call
module "test" {
  source = "../../"
  # source             = "Azure/avm-<res/ptn>-<name>/azurerm"
<<<<<<< HEAD
  # ...
  enable_telemetry    = var.enable_telemetry # see variables.tf
  name                = "TODO"               # TODO update with module.naming.<RESOURCE_TYPE>.name_unique
  resource_group_name = azurerm_resource_group.this.name
=======
  enable_telemetry            = local.enable_telemetry # see variables.tf
  resource_group_name         = module.naming.resource_group.name_unique
  location                    = local.location
  dedicated_host_group_name   = local.dedicated_host_group_name
  platform_fault_domain_count = local.platform_fault_domain_count
  automatic_placement_enabled = local.automatic_placement_enabled
  zone                        = local.zone
  tags                        = local.tags
  dedicated_hosts             = local.dedicated_hosts
>>>>>>> 1932195ddd8055d006cf9e731d7fadd75869c6ad
}
