## Create MySQL Server
resource "azurerm_mysql_server" "az_mysql_server" {
  name                = "az-mysql-db-raj"
  location            = var.location
  resource_group_name = var.my_rg_name_input

  administrator_login          = "mysqladmin"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "8.0"
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
    tags = var.mytags_input
}

## Create MySQL Database for Web App
resource "azurerm_mysql_database" "az_mysql_db" {
  name                = "az-mysql-db"
  resource_group_name = var.my_rg_name_input
  server_name         = azurerm_mysql_server.az_mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"

}

## Creating Firewall Rule to allow Azure Services
resource "azurerm_mysql_firewall_rule" "az_mysql_fw_rule" {
  name                = "az_web_app"
  resource_group_name = var.my_rg_name_input
  server_name         = azurerm_mysql_server.az_mysql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

## Get my IP public address
data "http" "mypublicip" {
  url = "https://ipinfo.io"
}

## Creating Firewall Rule to allow my public IP
resource "azurerm_mysql_firewall_rule" "az_mysql_fw_rule_2" {
  name                = "my_public_ip"
  resource_group_name = var.my_rg_name_input
  server_name         = azurerm_mysql_server.az_mysql_server.name
  start_ip_address    = format("%s", jsondecode(data.http.mypublicip.body).ip)
  end_ip_address      = format("%s", jsondecode(data.http.mypublicip.body).ip)
}