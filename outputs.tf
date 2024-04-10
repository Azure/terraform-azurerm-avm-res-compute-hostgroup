# The ID of the Dedicated Host Group
output "host_group_id" {
  value = azurerm_host_group.example.id
}

# The ID of the Dedicated Host
output "host_id" {
  value = azurerm_host.example.id
}