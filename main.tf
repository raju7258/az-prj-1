module "my_rg" {
  source   = "./modules/az-base"
  location = var.resource_location
}

module "my_web_app_sp" {
  source         = "./modules/az-web-apps"
  location       = var.resource_location
  my_rg_id_input = module.my_rg.my_rg_id_output
}