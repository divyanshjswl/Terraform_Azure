output "vnet_name" {
  description = "Name of the Virtual network"
  value       = azurerm_virtual_network.terraform_vnet.name
}
output "vnet_id" {
  description = "ID of the Vnet"
  value       = azurerm_virtual_network.terraform_vnet.name
}
output "vnet_location" {
  description = "Location of the Vnet"
  value       = azurerm_virtual_network.terraform_vnet.location
}