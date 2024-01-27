## Creating Azure Service Plan - Standard plan with Linux OS
resource "azurerm_service_plan" "az_web_app_sp" {
  name                = "az-web-app-sp-standard"
  location            = var.location
  resource_group_name = var.my_rg_id_input
  sku_name            = "S1"
  os_type             = "Linux"
}

## Creating Azure Web Apps 
resource "azurerm_linux_web_app" "az_web_app" {
  name                = "az-web-app"
  location            = var.location
  resource_group_name = var.my_rg_id_input
  service_plan_id     = azurerm_service_plan.az_web_app_sp.id
  zip_deploy_file = "./modules/az-web-apps/flaskBlog-main.zip"  


  site_config {
    local_mysql_enabled = true 
    application_stack {
      python_version      = "3.12"
    #   local_mysql_enabled = true
    }
  }
}