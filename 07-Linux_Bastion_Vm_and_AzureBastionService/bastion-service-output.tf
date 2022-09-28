#Azure Bastion service PIP output
output "azure_bastion_service_pip_id" {
  description = "ID of the ABS Public ip"
  value       = azurerm_public_ip.azure_bastion_service_puplic_ip.id
}

#Azure Bastion service Subnet output
output "azure_bastion_service_subnet_name" {
  description = "Name of the ABS Subnet"
  value       = azurerm_subnet.azure_bastion_service_subnet.name
}
output "azure_bastion_service_subnet_id" {
  description = "ID if ABS subnet"
  value       = azurerm_subnet.azure_bastion_service_subnet.id
}

#Azure Bastion service output
output "azure_bastion_service_name" {
  description = "Name of the ABS"
  value       = azurerm_bastion_host.azure_bastion_service.name
}
output "azure_bastion_service_dns_name" {
  description = "DNS name of ABS"
  value       = azurerm_bastion_host.azure_bastion_service.dns_name
}