#Azure Load balancer Public IP
output "azure_lb_public_ip" {
    description = "Public IP of the Azure Load balancer"
    value = azurerm_public_ip.azure_lb_public_ip.id
}


#Azure Load Balancer ID
output "azure_lb_id" {
    description = "ID of Azure Standard Load balancer"
    value = azurerm_lb.azure_standard_load_balancer.id
}

#Load Balancer Frontend IP Configuration
output "azure_lb_frontend_ip_configuration" {
    description = "Web LB frontend_ip_configuration Block"
    value = [azurerm_lb.azure_standard_load_balancer.frontend_ip_configuration]
}