# (Required) Specifies the name of the Dedicated Host Group
variable "dedicated_host_group_name" {
  type        = string
  description = "The name of the dedicated host."
}

# (Required) The Azure location where the Dedicated Host Group exists.
variable "location" {
  type        = string
  description = "The location where the dedicated host group will be created."
  nullable    = false
}

# (Required) The number of fault domains that the Dedicated Host Group spans
variable "platform_fault_domain_count" {
  type        = number
  description = "The number of fault domains that the host group can span."

  validation {
    condition     = var.platform_fault_domain_count <= 5 && var.platform_fault_domain_count >= 1
    error_message = "The platform fault domain count must be between 1 and 5."
  }
}

# (Required) Specifies the name of the resource group the Dedicated Host Group is located in
variable "resource_group_name" {
  type        = string
  description = "The resource group where dedicated host group will be deployed."
}

# (Optional) Would virtual machines or virtual machine scale sets be placed automatically on this Dedicated Host Group?
variable "automatic_placement_enabled" {
  type        = bool
  default     = true
  description = "Whether or not automatic placement is enabled for the host group."
}

# (Optional) A map of the hosts and their specifications in the Dedicated Host Group
variable "dedicated_hosts" {
  type = map(object({
    name                    = string
    sku_name                = string
    auto_replace_on_failure = optional(bool, true)
    platform_fault_domain   = number
    license_type            = optional(string, "None")
    tags                    = optional(map(string), null)
  }))
  default     = {}
  description = "(Optional) A map of the hosts and their specifications in the Dedicated Host Group"

  validation {
    condition     = alltrue([for host in values(var.dedicated_hosts) : contains(["None", "Windows_Server_Hybrid", "Windows_Server_Perpetual"], host.license_type)])
    error_message = "The license type must be one of None, Windows_Server_Hybrid or Windows_Server_Perpetual."
  }
  validation {
    # condition     = contains(local.valid_host_skus, var.dedicated_hosts[*].sku_name)
    condition = alltrue([for host in values(var.dedicated_hosts) : contains(["DADSv5-Type1", "DASv4-Type1", "DASv4-Type2", "DASv5-Type1", "DCSv2-Type1", "DDSv4-Type1", "DDSv4-Type2", "DDSv5-Type1", "DSv3-Type1", "DSv3-Type2", "DSv3-Type3", "DSv3-Type4", "DSv4-Type1", "DSv4-Type2", "DSv5-Type1", "EADSv5-Type1", "EASv4-Type1", "EASv4-Type2", "EASv5-Type1", "EDSv4-Type1", "EDSv4-Type2", "EDSv5-Type1", "ESv3-Type1", "ESv3-Type2", "ESv3-Type3", "ESv3-Type4", "ESv4-Type1", "ESv4-Type2", "ESv5-Type1", "FSv2-Type2", "FSv2-Type3", "FSv2-Type4", "FXmds-Type1", "LSv2-Type1", "LSv3-Type1", "MDMSv2MedMem-Type1", "MDSv2MedMem-Type1", "MMSv2MedMem-Type1", "MS-Type1", "MSm-Type1", "MSmv2-Type1", "MSv2-Type1", "MSv2MedMem-Type1", "NVASv4-Type1", "NVSv3-Type1"], host.sku_name)])
    # condition     = contains(["DADSv5-Type1", "DASv4-Type1", "DASv4-Type2", "DASv5-Type1", "DCSv2-Type1", "DDSv4-Type1", "DDSv4-Type2", "DDSv5-Type1", "DSv3-Type1", "DSv3-Type2", "DSv3-Type3", "DSv3-Type4", "DSv4-Type1", "DSv4-Type2", "DSv5-Type1", "EADSv5-Type1", "EASv4-Type1", "EASv4-Type2", "EASv5-Type1", "EDSv4-Type1", "EDSv4-Type2", "EDSv5-Type1", "ESv3-Type1", "ESv3-Type2", "ESv3-Type3", "ESv3-Type4", "ESv4-Type1", "ESv4-Type2", "ESv5-Type1", "FSv2-Type2", "FSv2-Type3", "FSv2-Type4", "FXmds-Type1", "LSv2-Type1", "LSv3-Type1", "MDMSv2MedMem-Type1", "MDSv2MedMem-Type1", "MMSv2MedMem-Type1", "MS-Type1", "MSm-Type1", "MSmv2-Type1", "MSv2-Type1", "MSv2MedMem-Type1", "NVASv4-Type1", "NVSv3-Type1"], var.dedicated_hosts[*].sku_name)    
    error_message = "SKU must be one of the supported values"
  }
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

# (Optional) A mapping of tags to assign to the resource
variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Tags of the resource"
}

# (Optional) Specifies the Availability Zone in which this Dedicated Host Group should be located
variable "zone" {
  type        = string
  default     = null
  description = "The Availability Zone for the Dedicated Host Group."
}
