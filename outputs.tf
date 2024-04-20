# The ID of the Dedicated Host Group
output "host_group_id" {
  value = azurerm_dedicated_host_group.example.id
}

# The ID of the Dedicated Host as a list
output "host_ids" {
  value = azurerm_dedicated_host.example[*].id
}