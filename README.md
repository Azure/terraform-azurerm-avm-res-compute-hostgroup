<!-- BEGIN_TF_DOCS -->
# terraform-azurerm-avm-res-compute-hostgroup

This is an AVM module to deploy dedicated host groups in Azure.

To use this module in your Terraform configuration, you'll need to provide values for the required variables. Here's a basic example:

```
module "azure_computehostgroup" {
  source = "./path_to_this_module"

  // ... mandatory variables ...
  dedicated_host_group_name = "dedicated_host_groupname"
  resource_group_name = "resource_group_name"
  location = "location"
  platform_fault_domain_count = 5 //acceptable values between 1 and 5

  // ... other optional variables, see example ...
}
```

> [!IMPORTANT]
> As the overall AVM framework is not GA (generally available) yet - the CI framework and test automation is not fully functional and implemented across all supported languages yet - breaking changes are expected, and additional customer feedback is yet to be gathered and incorporated. Hence, modules **MUST NOT** be published at version `1.0.0` or higher at this time.
>
> All module **MUST** be published as a pre-release version (e.g., `0.1.0`, `0.1.1`, `0.2.0`, etc.) until the AVM framework becomes GA.
>
> However, it is important to note that this **DOES NOT** mean that the modules cannot be consumed and utilized. They **CAN** be leveraged in all types of environments (dev, test, prod etc.). Consumers can treat them just like any other IaC module and raise issues or feature requests against them as they learn from the usage of the module. Consumers should also read the release notes for each version, if considering updating to a more recent version of a module to see if there are any considerations or breaking changes etc.

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9, < 2.0)

- <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) (~> 2.4)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 4.0, < 5.0)

- <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) (~> 0.3)

- <a name="requirement_random"></a> [random](#requirement\_random) (>= 3.5.0)

## Resources

The following resources are used by this module:

- [azurerm_dedicated_host.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dedicated_host) (resource)
- [azurerm_dedicated_host_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dedicated_host_group) (resource)
- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)
- [modtm_telemetry.telemetry](https://registry.terraform.io/providers/azure/modtm/latest/docs/resources/telemetry) (resource)
- [random_uuid.telemetry](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) (resource)
- [azapi_client_config.telemetry](https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/client_config) (data source)
- [modtm_module_source.telemetry](https://registry.terraform.io/providers/azure/modtm/latest/docs/data-sources/module_source) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_dedicated_host_group_name"></a> [dedicated\_host\_group\_name](#input\_dedicated\_host\_group\_name)

Description: The name of the dedicated host.

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: The location where the dedicated host group will be created.

Type: `string`

### <a name="input_platform_fault_domain_count"></a> [platform\_fault\_domain\_count](#input\_platform\_fault\_domain\_count)

Description: The number of fault domains that the host group can span.

Type: `number`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The resource group where dedicated host group will be deployed.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_automatic_placement_enabled"></a> [automatic\_placement\_enabled](#input\_automatic\_placement\_enabled)

Description: Whether or not automatic placement is enabled for the host group.

Type: `bool`

Default: `true`

### <a name="input_dedicated_hosts"></a> [dedicated\_hosts](#input\_dedicated\_hosts)

Description: (Optional) A map of the hosts and their specifications in the Dedicated Host Group

Type:

```hcl
map(object({
    name                    = string
    sku_name                = string
    auto_replace_on_failure = optional(bool, true)
    platform_fault_domain   = number
    license_type            = optional(string, "None")
    tags                    = optional(map(string), null)
  }))
```

Default: `{}`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see <https://aka.ms/avm/telemetryinfo>.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: (Optional) Tags of the resource

Type: `map(string)`

Default: `null`

### <a name="input_zone"></a> [zone](#input\_zone)

Description: The Availability Zone for the Dedicated Host Group.

Type: `string`

Default: `null`

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

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->