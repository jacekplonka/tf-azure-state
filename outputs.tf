output "resource_group_name" {
  value = azurerm_resource_group.state_rg.name
  sensitive = false
}

output "storage_account_name" {
  value = azurerm_storage_account.state_sa.name
  sensitive = false
}

output "storage_account_access_key" {
  value = azurerm_storage_account.state_sa.primary_access_key
  sensitive = false
}

output "container_name" {
  value = azurerm_storage_container.state_container.name
  sensitive = false
}
