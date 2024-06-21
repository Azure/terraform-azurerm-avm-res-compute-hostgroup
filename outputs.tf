# The ID of the Dedicated Host Group
output "host_group_id" {
  value = azurerm_dedicated_host_group.this.id
}

# The ID of the Dedicated Host as a list
/*
output "host_ids" {
  value = azurerm_dedicated_host.this[*].id
}
*/

output "host_ids" {
  value = {
    for k, v in azurerm_dedicated_host.this : k => v.id
  }
}