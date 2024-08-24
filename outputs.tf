<<<<<<< HEAD
output "private_endpoints" {
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
  value       = azurerm_private_endpoint.this
=======
# A map of the hosts in the Dedicated Host Group to the resource IDs
output "host_ids" {
  description = "A map of the hosts in the Dedicated Host Group to the resource IDs"
  value = {
    for k, v in azurerm_dedicated_host.this : k => v.id
  }
>>>>>>> 1932195ddd8055d006cf9e731d7fadd75869c6ad
}

# The name of the Dedicated Host Group
output "name" {
  description = "The name of the Dedicated Host Group"
  value       = azurerm_dedicated_host_group.this.name
}

# All atrributes of the Dedicated Host group
output "resource" {
<<<<<<< HEAD
  description = "This is the full output for the resource."
  value       = azurerm_resource_group.TODO # TODO: Replace this dummy resource azurerm_resource_group.TODO with your module resource
=======
  description = "All atrributes of the Dedicated Host group"
  value       = azurerm_dedicated_host_group.this
}

# The resource ID of the Dedicated Host Group
output "resource_id" {
  description = "The resource ID of the Dedicated Host Group"
  value       = azurerm_dedicated_host_group.this.id
>>>>>>> 1932195ddd8055d006cf9e731d7fadd75869c6ad
}
