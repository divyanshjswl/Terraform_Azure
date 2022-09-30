#web tier
#subnet output
output "web_tier_subnet_id" {
    description = "web tier subnet id"
    value = azurerm_subnet.web_tier_subnet.id
}
output "web_tier_subnet_name" {
    description = "web tier subnet name"
    value = azurerm_subnet.web_tier_subnet.name
}

#nsg output
output "web_tier_nsg_name" {
    description = "web tier nsg name"
    value = azurerm_network_security_group.web_tier_subnet_nsg.name
}
output "web_tier_nsg_id" {
    description = "web tier nsg id"
    value = azurerm_network_security_group.web_tier_subnet_nsg.id
}
##########################################################################################################
#app tier
#subnet output
output "app_tier_subnet_id" {
    description = "app tier subnet id"
    value = azurerm_subnet.app_tier_subnet.id
}
output "app_tier_subnet_name" {
    description = "app tier subnet name"
    value = azurerm_subnet.app_tier_subnet.name
}

#nsg output
output "app_tier_nsg_name" {
    description = "app tier nsg name"
    value = azurerm_network_security_group.app_tier_subnet_nsg.name
}
output "app_tier_nsg_id" {
    description = "app tier nsg id"
    value = azurerm_network_security_group.app_tier_subnet_nsg.id
}
##########################################################################################################
#db tier
#subnet output
output "db_tier_subnet_id" {
    description = "db tier subnet id"
    value = azurerm_subnet.db_tier_subnet.id
}
output "db_tier_subnet_name" {
    description = "db tier subnet name"
    value = azurerm_subnet.db_tier_subnet.name
}

#nsg output
output "db_tier_nsg_name" {
    description = "db tier nsg name"
    value = azurerm_network_security_group.db_tier_subnet_nsg.name
}
output "db_tier_nsg_id" {
    description = "db tier nsg id"
    value = azurerm_network_security_group.db_tier_subnet_nsg.id
}
##########################################################################################################
#bastion tier
#subnet output
output "bastion_tier_subnet_id" {
    description = "bastion tier subnet id"
    value = azurerm_subnet.bastion_tier_subnet.id
}
output "bastion_tier_subnet_name" {
    description = "bastion tier subnet name"
    value = azurerm_subnet.bastion_tier_subnet.name
}

#nsg output
output "bastion_tier_nsg_name" {
    description = "bastion tier nsg name"
    value = azurerm_network_security_group.bastion_tier_subnet_nsg.name
}
output "bastion_tier_nsg_id" {
    description = "bastion tier nsg id"
    value = azurerm_network_security_group.bastion_tier_subnet_nsg.id
}