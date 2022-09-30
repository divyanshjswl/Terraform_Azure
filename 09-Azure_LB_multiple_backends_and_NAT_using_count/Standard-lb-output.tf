output "azure_lb_id" {
  description = "The Load Balancer ID"
  value       = azurerm_lb.azure_lb.id
}

output "azire_lb_public_id" {
  description = "Public IP address of th Load Balancer"
  value       = azurerm_public_ip.azure_load_balancer_pip.ip_address
}

output "azure_lb_frontend_ip_conf" {
  description = "Azure LB frontend_ip_configuration Block"
  value       = [azurerm_lb.azure_lb.frontend_ip_configuration]
}