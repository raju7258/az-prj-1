output "my_rg_name_output" {
  value       = data.azurerm_resource_group.az_rg.name
  description = "My resource group"
}
