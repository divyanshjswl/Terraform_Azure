output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.terraform_vnet.name
}
output "vnet_id" {
  description = "ID of the Virual Network"
  value       = azurerm_virtual_network.terraform_vnet.id
}
output "vnet_location" {
  description = "Location of the Virtual Network"
  value       = azurerm_virtual_network.terraform_vnet.location
}