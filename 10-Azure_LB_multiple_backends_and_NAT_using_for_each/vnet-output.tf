output "terraform_vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.terraform_vnet.id
}
output "terrafrom_vnet_name" {
  description = "Name of the Virtual network"
  value       = azurerm_virtual_network.terraform_vnet.name
}
output "terraform_vnet_address_space" {
  description = "Address space of the Vnet"
  value       = azurerm_virtual_network.terraform_vnet.address_space
}