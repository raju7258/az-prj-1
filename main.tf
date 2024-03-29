module "my_rg" {
  source   = "./modules/az-base"
  location = var.resource_location
}

module "my_web_app_sp" {
  source                  = "./modules/az-web-apps"
  location                = var.resource_location
  my_rg_name_input        = module.my_rg.my_rg_name_output
  mytags_input            = var.mytags
  mysql_username_input    = var.mysql_username
  mysql_server_fqdn_input = module.my_mysql_db.az_mysql_server_fqdn
  mysql_password_input    = var.mysql_password
}

module "my_mysql_db" {
  source               = "./modules/az-mysql-database"
  location             = var.resource_location
  my_rg_name_input     = module.my_rg.my_rg_name_output
  mytags_input         = var.mytags
  mysql_username_input = var.mysql_username
  mysql_password_input = var.mysql_password
}