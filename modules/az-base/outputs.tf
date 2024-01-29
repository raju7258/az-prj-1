output "my_rg_id_output" {
  value       = data.azurerm_resource_group.az_rg.name
  description = "My resource group"
}
