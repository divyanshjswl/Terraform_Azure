#APP Tier   

#NSG Output
output "app_tier_nsg_name" {
  description = "App tier NSG name"
  value       = azurerm_network_security_group.app_tier_nsg.name
}
output "app_tier_nsg_id" {
  description = "App tier NSG id"
  value       = azurerm_network_security_group.app_tier_nsg.id
}
#Subnet Output
output "app_tier_subnet_name" {
  description = "App tier subnet name"
  value       = azurerm_subnet.app_tier_subnet.name
}
output "app_tier_subnet_id" {
  description = "App tier subnet id"
  value       = azurerm_subnet.app_tier_subnet.id
}

##############################################################################################
#Web Tier

#NSG Output
output "web_tier_nsg_name" {
  description = "Web tier NSG name"
  value       = azurerm_network_security_group.web_tier_nsg.name
}
output "web_tier_nsg_id" {
  description = "Web tier NSG id"
  value       = azurerm_network_security_group.web_tier_nsg.id
}
#Subnet Output
output "web_tier_subnet_name" {
  description = "Web tier subnet name"
  value       = azurerm_subnet.web_tier_subnet.name
}
output "web_tier_subnet_id" {
  description = "Web tier subnet id"
  value       = azurerm_subnet.web_tier_subnet.id
}

##############################################################################################
#Db Tier

#Db Output
output "db_tier_nsg_name" {
  description = "Db tier NSG name"
  value       = azurerm_network_security_group.db_tier_nsg.name
}
output "db_tier_nsg_id" {
  description = "Db tier NSG id"
  value       = azurerm_network_security_group.db_tier_nsg.id
}
#Subnet Output
output "db_tier_subnet_name" {
  description = "Db tier subnet name"
  value       = azurerm_subnet.db_tier_subnet.name
}
output "db_tier_subnet_id" {
  description = "Db tier subnet id"
  value       = azurerm_subnet.db_tier_subnet.id
}

##############################################################################################
#Bastion Tier

#Bastion Output
output "bastion_tier_nsg_name" {
  description = "Bastion tier NSG name"
  value       = azurerm_network_security_group.bastion_tier_nsg.name
}
output "bastion_tier_nsg_id" {
  description = "Bastion tier NSG id"
  value       = azurerm_network_security_group.bastion_tier_nsg.id
}
#Subnet Output
output "bastion_tier_subnet_name" {
  description = "Bastion tier subnet name"
  value       = azurerm_subnet.bastion_tier_subnet.name
}
output "bastion_tier_subnet_id" {
  description = "Bastion tier subnet id"
  value       = azurerm_subnet.bastion_tier_subnet.id
}
