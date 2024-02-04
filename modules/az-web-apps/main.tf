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
    application_stack {
      python_version      = "3.12"
    }
  }
  connection_string {
    name = "mysql_server_fqdn"
    type = "MySql"
    value = var.mysql_server_fqdn_input
  }
  connection_string {
    name = "mysql_server_username"
    type = "MySql"
    value = var.mysql_username_input
  }
  connection_string {
    name = "mysql_server_password"
    type = "MySql"
    value = var.mysql_password_input
  }
  tags = var.mytags_input
}

## Creating Azure Linux Webapp Dev Deployment Slot
resource "azurerm_linux_web_app_slot" "az_web_app_dev_slot" {
  name           = "az-web-app-dev-slot"
  app_service_id = azurerm_linux_web_app.az_web_app.id

  site_config {
    application_stack {
      python_version = "3.12"
    }
  }
  connection_string {
    name = "mysql_server_fqdn"
    type = "MySql"
    value = var.mysql_server_fqdn_input
  }
  connection_string {
    name = "mysql_server_username"
    type = "MySql"
    value = var.mysql_username_input
  }
  connection_string {
    name = "mysql_server_password"
    type = "MySql"
    value = var.mysql_password_input
  }
  tags = var.mytags_input
}

## Creating Azure Linux Webapp Staging Deployment Slot
resource "azurerm_linux_web_app_slot" "az_web_app_staging_slot" {
  name           = "az-web-app-staging-slot"
  app_service_id = azurerm_linux_web_app.az_web_app.id

  site_config {
    application_stack {
      python_version = "3.12"
    }
  }
  connection_string {
    name = "mysql_server_fqdn"
    type = "MySql"
    value = var.mysql_server_fqdn_input
  }
  connection_string {
    name = "mysql_server_username"
    type = "MySql"
    value = var.mysql_username_input
  }
  connection_string {
    name = "mysql_server_password"
    type = "MySql"
    value = var.mysql_password_input
  }
  tags = var.mytags_input
}

## Creating Azure Linux Webapp Prod Deployment Slot
resource "azurerm_linux_web_app_slot" "az_web_app_prod_slot" {
  name           = "az-web-app-prod-slot"
  app_service_id = azurerm_linux_web_app.az_web_app.id

  site_config {
    application_stack {
      python_version = "3.12"
    }
  }
  connection_string {
    name = "mysql_server_fqdn"
    type = "MySql"
    value = var.mysql_server_fqdn_input
  }
  connection_string {
    name = "mysql_server_username"
    type = "MySql"
    value = var.mysql_username_input
  }
  connection_string {
    name = "mysql_server_password"
    type = "MySql"
    value = var.mysql_password_input
  }

  tags = var.mytags_input
}

## Deploy code from a Public Github repo 
resource "azurerm_app_service_source_control" "my_sourcecode" {
  app_id                 = azurerm_linux_web_app.az_web_app.id
  repo_url               = "https://github.com/raju7258/python-example-project"
  branch                 = "main"
  use_manual_integration = true
  use_mercurial          = false
}

## Define a web app active slot
resource "azurerm_web_app_active_slot" "az_web_app_active_slot" {
  slot_id = azurerm_linux_web_app_slot.az_web_app_prod_slot.id

}