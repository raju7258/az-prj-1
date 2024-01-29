##Data Source to fetch the resource group
data "azurerm_resource_group" "az_rg" {
  name = "az-rajesh-nair-rg"
}

## Data Source to fetch the location
data "azurerm_location" "location" {
  location = var.location
}