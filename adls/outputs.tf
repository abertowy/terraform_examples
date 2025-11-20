output "storage_account_name" {
  description = "The name of the created storage account"
  value       = azurerm_storage_account.datalake.name
}

output "storage_account_id" {
  description = "The id of the created storage account"
  value       = azurerm_storage_account.datalake.id
}

output "containers" {
  description = "Map of container names to ids"
  value = {
    bronze = azurerm_storage_container.bronze.id
    silver = azurerm_storage_container.silver.id
    gold   = azurerm_storage_container.gold.id
  }
}
