variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

# (Required) Specifies the name of the resource group the Dedicated Host Group is located in
variable "resource_group_name" {
  type        = string
  description = "The resource group where dedicated host group will be deployed."
}

# (Required) The Azure location where the Dedicated Host Group exists.
variable "location" {
  type        = string
  description = "The location where the dedicated host group will be created."
}

# (Required) Specifies the name of the Dedicated Host Group
variable "dedicated_host_group_name" {
  type        = string
  description = "The name of the dedicated host."
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

# (Required) The name of the dedicated host
variable "dedicated_host_name" {
  type        = string
  description = "The name of the dedicated host."
}

# (Required) The SKU of the dedicated host
variable "dedicated_host_sku_name" {
  type        = string
  description = "The SKU of the dedicated host."

  validation {
    condition     = contains(local.valid_host_skus, var.dedicated_host_sku_name)
    error_message = "sku must be 'apple', 'banana', or 'orange'"
  }

}

# (Required) The platform fault domain of the dedicated host
variable "platform_fault_domain" {
  type        = number
  description = "The platform fault domain of the dedicated host."
}



# (Optional) Would virtual machines or virtual machine scale sets be placed automatically on this Dedicated Host Group?
variable "automatic_placement_enabled" {
  type        = bool
  description = "Whether or not automatic placement is enabled for the host group."
  default     = true
}

# (Optional) Specifies the Availability Zone in which this Dedicated Host Group should be located
variable "zone" {
  type        = string
  description = "The Availability Zone for the Dedicated Host Group."
  default     = null
}

# (Optional) A mapping of tags to assign to the resource
variable "tags" {
  type        = map(any)
  description = "The map of tags to be applied to the resource"
  default     = {}
}

# (Optional) Specifies whether the host should be replaced automatically in case of a failure
variable "auto_replace_on_failure" {
  type        = bool
  description = "Whether or not the host should be replaced automatically in case of a failure."
  default     = true
}

# (Optional) Specifies the license type for the Dedicated Host
variable "license_type" {
  type        = string
  description = "The license type for the Dedicated Host."
  default     = "None"

  # check if the provided value is None, Windows_Server_Hybrid or Windows_Server_Perpetual and return an error if it is not one of these values
  validation {
    condition     = var.license_type == "None" || var.license_type == "Windows_Server_Hybrid" || var.license_type == "Windows_Server_Perpetual"
    error_message = "The license type must be one of None, Windows_Server_Hybrid or Windows_Server_Perpetual."
  }
}