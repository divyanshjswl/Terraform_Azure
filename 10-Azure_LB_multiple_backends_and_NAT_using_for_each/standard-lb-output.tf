output "standard_lb_public_ip_address" {
  description = "value"
  value       = azurerm_public_ip.standard_lb_pip
}
output "standard_lb_id" {
  description = "value"
  value       = azurerm_lb.azure_standard_lb.id
}
output "standard_lb_frontend_ip_configuration" {
  description = "value"
  value       = [azurerm_lb.azure_standard_lb.frontend_ip_configuration]
}