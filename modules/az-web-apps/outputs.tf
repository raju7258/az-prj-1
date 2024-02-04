output az_web_app_outbound_ips {
  value       = azurerm_linux_web_app.az_web_app.possible_outbound_ip_address_list
  description = "Web App Outbound IPs"
}
