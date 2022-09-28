output "vnet_id" {
  description = "The virtual NetworkConfiguration ID"
  value       = azurerm_virtual_network.terraform_vnet.id
}
output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.terraform_vnet.name
}
output "vnet_address_space" {
  description = "The list of address spaces used by the virtual network"
  value       = azurerm_virtual_network.terraform_vnet.address_space
}