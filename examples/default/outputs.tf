# The ID of the Dedicated Host Group
output "host_group_id" {
  value = module.test.host_group_id
}

# The ID of the Dedicated Host as a list
output "host_ids" {
  value = module.test.host_ids
}