locals {
  automatic_placement_enabled = true
  dedicated_host_group_name   = "testhg"
  dedicated_hosts = {
    host1 = {
      name                    = "host1",
      sku_name                = "DDSv4-Type1",
      platform_fault_domain   = 0,
      auto_replace_on_failure = true,
      license_type            = "Windows_Server_Hybrid",
      tags = {
        environment = "staging",
        costcenter  = "12345"
      }
    },
    host2 = {
      name                    = "host2",
      sku_name                = "DSv4-Type1",
      platform_fault_domain   = 1,
      auto_replace_on_failure = true,
      tags = {
        environment = "staging",
        costcenter  = "12345"
      }
    }
  }
  enable_telemetry            = true
  location                    = "EastUS2"
  platform_fault_domain_count = 3
  resource_group_name         = "testrg"
  tags = {
    environment = "staging",
    costcenter  = "12345"
  }
  zone = "1"
}