# A map of the hosts in the Dedicated Host Group to the resource IDs
output "host_ids" {
  description = "A map of the hosts in the Dedicated Host Group to the resource IDs"
  value = {
    for k, v in azurerm_dedicated_host.this : k => v.id
  }
}

# The name of the Dedicated Host Group
output "name" {
  description = "The name of the Dedicated Host Group"
  value       = azurerm_dedicated_host_group.this.name
}

# All atrributes of the Dedicated Host group
output "resource" {
  description = "All atrributes of the Dedicated Host group"
  value       = azurerm_dedicated_host_group.this
}

# The resource ID of the Dedicated Host Group
output "resource_id" {
  description = "The resource ID of the Dedicated Host Group"
  value       = azurerm_dedicated_host_group.this.id
}
