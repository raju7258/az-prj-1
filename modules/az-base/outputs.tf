output "my_rg_id_output" {
  value       = data.azurerm_resources.az_rg.id
  description = "My resource group"
}
