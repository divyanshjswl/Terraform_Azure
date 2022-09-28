#app tier
#subnet output
output "app_tier_subnet_id" {
  description = "Subnet Id of app tier subnet"
  value       = azurerm_subnet.app_tier_subnet.id
}
output "app_tier_subnet_name" {
  description = "Subnet name of app tier subnet"
  value       = azurerm_subnet.app_tier_subnet.name
}
#nsg output
output "app_tier_nsg_id" {
  description = "NSG ID of app tier NSG"
  value       = azurerm_network_security_group.app_tier_subnet_nsg.id
}
output "app_tier_nsg_name" {
  description = "NSG name of app tier NSG"
  value       = azurerm_network_security_group.app_tier_subnet_nsg.name
}
##############################################################################################
#web tier
output "web_tier_subnet_id" {
  description = "Subnet Id of web tier subnet"
  value       = azurerm_subnet.web_tier_subnet.id
}
output "web_tier_subnet_name" {
  description = "Subnet name of web tier subnet"
  value       = azurerm_subnet.web_tier_subnet.name
}
#nsg output
output "web_tier_nsg_id" {
  description = "NSG ID of web tier NSG"
  value       = azurerm_network_security_group.web_tier_subnet_nsg.id
}
output "web_tier_nsg_name" {
  description = "NSG name of web tier NSG"
  value       = azurerm_network_security_group.web_tier_subnet_nsg.name
}

##############################################################################################
#db tier
output "db_tier_subnet_id" {
  description = "Subnet Id of db tier subnet"
  value       = azurerm_subnet.db_tier_subnet.id
}
output "db_tier_subnet_name" {
  description = "Subnet name of db tier subnet"
  value       = azurerm_subnet.db_tier_subnet.name
}
#nsg output
output "db_tier_nsg_id" {
  description = "NSG ID of db tier NSG"
  value       = azurerm_network_security_group.db_tier_subnet_nsg.id
}
output "db_tier_nsg_name" {
  description = "NSG name of db tier NSG"
  value       = azurerm_network_security_group.db_tier_subnet_nsg.name
}

##############################################################################################
#bastion tier
output "bastion_tier_subnet_id" {
  description = "Subnet Id of bastion tier subnet"
  value       = azurerm_subnet.bastion_tier_subnet.id
}
output "bastion_tier_subnet_name" {
  description = "Subnet name of bastion tier subnet"
  value       = azurerm_subnet.bastion_tier_subnet.name
}
#nsg output
output "bastion_tier_nsg_id" {
  description = "NSG ID of bastion tier NSG"
  value       = azurerm_network_security_group.bastion_tier_subnet_nsg.id
}
output "bastion_tier_nsg_name" {
  description = "NSG name of bastion tier NSG"
  value       = azurerm_network_security_group.bastion_tier_subnet_nsg.name
}


