## Creating Azure Service Plan - Standard plan with Linux OS
resource "azurerm_service_plan" "az_web_app_sp" {
  name                = "az-web-app-sp-standard"
  location            = var.location
  resource_group_name = var.my_rg_name_input
  sku_name            = "S1"
  os_type             = "Linux"
  tags                = var.mytags_input
}

## Creating Azure Web Apps 
resource "azurerm_linux_web_app" "az_web_app" {
  name                = "az-web-app75648"
  location            = var.location
  resource_group_name = var.my_rg_name_input
  service_plan_id     = azurerm_service_plan.az_web_app_sp.id

  site_config {
    # default_documents = [ "app.py" ]
    # application_stack {
    #   python_version      = "3.12"
    # }
  }
  tags = var.mytags_input
}

## Creating Azure Linux Webapp Slot
resource "azurerm_linux_web_app_slot" "az_web_app_dev_slot"{
    name = "az-web-app-dev-slot"
    app_service_id = azurerm_linux_web_app.az_web_app.id

    site_config {
        application_stack {
          python_version      = "3.12"
        }
    }
}