<!-- BEGIN_TF_DOCS -->
# Default example

This deploys the module in its simplest form.

```hcl
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
```

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9, < 2.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.71.0)

## Resources

No resources.

<!-- markdownlint-disable MD013 -->
## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_host_ids"></a> [host\_ids](#output\_host\_ids)

Description: A map of the hosts in the Dedicated Host Group to the resource IDs

### <a name="output_name"></a> [name](#output\_name)

Description: The name of the Dedicated Host Group

### <a name="output_resource"></a> [resource](#output\_resource)

Description: All atrributes of the Dedicated Host group

### <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id)

Description: The resource ID of the Dedicated Host Group

## Modules

The following Modules are called:

### <a name="module_naming"></a> [naming](#module\_naming)

Source: Azure/naming/azurerm

Version: 0.3.0

### <a name="module_test"></a> [test](#module\_test)

Source: ../../

Version:

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->