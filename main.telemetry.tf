data "azurerm_client_config" "telemetry" {
  count = var.enable_telemetry ? 1 : 0
}

data "modtm_module_source" "telemetry" {
  count = var.enable_telemetry ? 1 : 0

  module_path = path.module
<<<<<<< HEAD
}

resource "random_uuid" "telemetry" {
  count = var.enable_telemetry ? 1 : 0
}

resource "modtm_telemetry" "telemetry" {
  count = var.enable_telemetry ? 1 : 0

  tags = {
    subscription_id = one(data.azurerm_client_config.telemetry).subscription_id
    tenant_id       = one(data.azurerm_client_config.telemetry).tenant_id
    module_source   = one(data.modtm_module_source.telemetry).module_source
    module_version  = one(data.modtm_module_source.telemetry).module_version
    random_id       = one(random_uuid.telemetry).result
  }
=======
>>>>>>> 1932195ddd8055d006cf9e731d7fadd75869c6ad
}

resource "random_uuid" "telemetry" {
  count = var.enable_telemetry ? 1 : 0
}

resource "modtm_telemetry" "telemetry" {
  count = var.enable_telemetry ? 1 : 0

  tags = {
    subscription_id = one(data.azurerm_client_config.telemetry).subscription_id
    tenant_id       = one(data.azurerm_client_config.telemetry).tenant_id
    module_source   = one(data.modtm_module_source.telemetry).module_source
    module_version  = one(data.modtm_module_source.telemetry).module_version
    random_id       = one(random_uuid.telemetry).result
  }
}