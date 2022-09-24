#WEB TIER SUBNET NSG OUTPUT

#web_tier_subnet
output "web_tier_subnet_name" {
  description = "name of web tier subnet"
  value       = azurerm_subnet.web_tier_subnet.name
}
output "web_tier_subnet_id" {
  description = "Id of the web tier subnet"
  value       = azurerm_subnet.web_tier_subnet.id
}

#web_tier_nsg
output "web_tier_nsg_name" {
  description = "Name of the web tier subnet NSG"
  value       = azurerm_network_security_group.web_tier_nsg.name
}
output "web_tier_nsg_id" {
  description = "ID of the web tier subnet NSG"
  value       = azurerm_network_security_group.web_tier_nsg.id
}

#############################################################################################################################

#APP TIER SUBNET NSG OUTPUT
output "app_tier_subnet_name" {
  description = "name of web tier subnet"
  value       = azurerm_subnet.app_tier_subnet.name
}
output "app_tier_subnet_id" {
  description = "Id of the web tier subnet"
  value       = azurerm_subnet.app_tier_subnet.id
}

#web_tier_nsg
output "app_tier_nsg_name" {
  description = "Name of the web tier subnet NSG"
  value       = azurerm_network_security_group.app_tier_nsg.name
}
output "app_tier_nsg_id" {
  description = "ID of the web tier subnet NSG"
  value       = azurerm_network_security_group.app_tier_nsg.id
}

#############################################################################################################################

#DB TIER SUBNET NSG OUTPUT
output "db_tier_subnet_name" {
  description = "name of web tier subnet"
  value       = azurerm_subnet.db_tier_subnet.name
}
output "db_tier_subnet_id" {
  description = "Id of the web tier subnet"
  value       = azurerm_subnet.db_tier_subnet.id
}

#web_tier_nsg
output "db_tier_nsg_name" {
  description = "Name of the web tier subnet NSG"
  value       = azurerm_network_security_group.db_tier_nsg.name
}
output "db_tier_nsg_id" {
  description = "ID of the web tier subnet NSG"
  value       = azurerm_network_security_group.db_tier_nsg.id
}


#############################################################################################################################

#BASTION TIER SUBNET NSG OUTPUT
output "bastion_tier_subnet_name" {
  description = "name of web tier subnet"
  value       = azurerm_subnet.bastion_tier_subnet.name
}
output "bastion_tier_subnet_id" {
  description = "Id of the web tier subnet"
  value       = azurerm_subnet.bastion_tier_subnet.id
}

#web_tier_nsg
output "bastion_tier_nsg_name" {
  description = "Name of the web tier subnet NSG"
  value       = azurerm_network_security_group.bastion_tier_nsg.name
}
output "bastion_tier_nsg_id" {
  description = "ID of the web tier subnet NSG"
  value       = azurerm_network_security_group.bastion_tier_nsg.id
}