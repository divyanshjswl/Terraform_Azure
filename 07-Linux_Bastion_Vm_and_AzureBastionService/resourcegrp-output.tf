output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.terraform_rg.name
}
output "resource_group_location" {
  description = "Location of tge resource group" //This we will use as common location for all the resources
  value       = azurerm_resource_group.terraform_rg.location
}