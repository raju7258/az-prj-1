##Data Source to fetch the resource group
data "azurerm_resources" "az_rg" {
  resource_group_name = "az-rajesh-nair-rg"
}

## Data Source to fetch the location
data "azurerm_location" "location" {
  location = var.location
}