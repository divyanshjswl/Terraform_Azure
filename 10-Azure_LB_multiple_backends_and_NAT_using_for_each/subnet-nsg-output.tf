#web tier
#subnet
output "web_tier_subnet_name" {
  description = "Name of the web tier subnet"
  value       = azurerm_subnet.web_tier_subnet.name
}
output "web_tier_subnet_id" {
  description = "ID of the web tier subnet"
  value       = azurerm_subnet.web_tier_subnet.id
}
#nsg
output "web_tier_nsg_name" {
  description = "Name of the web tier subnet nag"
  value       = azurerm_network_security_group.web_tier_subnet_nsg.name
}
output "web_tier_nsg_id" {
  description = "ID of the web tier subnet nag"
  value       = azurerm_network_security_group.web_tier_subnet_nsg.id
}
#################################################################################################

#app tier
#subnet
output "app_tier_subnet_name" {
  description = "Name of the app tier subnet"
  value       = azurerm_subnet.app_tier_subnet.name
}
output "app_tier_subnet_id" {
  description = "ID of the app tier subnet"
  value       = azurerm_subnet.app_tier_subnet.id
}
#nsg
output "app_tier_nsg_name" {
  description = "Name of the app tier subnet nag"
  value       = azurerm_network_security_group.app_tier_subnet_nsg.name
}
output "app_tier_nsg_id" {
  description = "ID of the app tier subnet nag"
  value       = azurerm_network_security_group.app_tier_subnet_nsg.id
}
#################################################################################################

#bastion tier
#subnet
output "bastion_tier_subnet_name" {
  description = "Name of the bastion tier subnet"
  value       = azurerm_subnet.bastion_tier_subnet.name
}
output "bastion_tier_subnet_id" {
  description = "ID of the bastion tier subnet"
  value       = azurerm_subnet.bastion_tier_subnet.id
}
#nsg
output "bastion_tier_nsg_name" {
  description = "Name of the bastion tier subnet nag"
  value       = azurerm_network_security_group.bastion_tier_subnet_nsg.name
}
output "bastion_tier_nsg_id" {
  description = "ID of the bastion tier subnet nag"
  value       = azurerm_network_security_group.bastion_tier_subnet_nsg.id
}
#################################################################################################

#db tier
#subnet
output "db_tier_subnet_name" {
  description = "Name of the db tier subnet"
  value       = azurerm_subnet.db_tier_subnet.name
}
output "db_tier_subnet_id" {
  description = "ID of the db tier subnet"
  value       = azurerm_subnet.db_tier_subnet.id
}
#nsg
output "db_tier_nsg_name" {
  description = "Name of the db tier subnet nag"
  value       = azurerm_network_security_group.db_tier_subnet_nsg.name
}
output "db_tier_nsg_id" {
  description = "ID of the db tier subnet nag"
  value       = azurerm_network_security_group.db_tier_subnet_nsg.id
}


