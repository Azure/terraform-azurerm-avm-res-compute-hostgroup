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
