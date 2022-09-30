output "vnet_id" {
    description = "ID of the Vnet"
    value = azurerm_virtual_network.terraform_vnet.id
}
output "vnet_name" {
    description = "Name of the Vnet"
    value = azurerm_virtual_network.terraform_vnet.name
}
output "vnet_address_space" {
    description = "Address space of the Vnet"
    value = azurerm_virtual_network.terraform_vnet.address_space
}