output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.terraform_resource_group.name
}
output "resource_group_id" {
  description = "ID of the resource group"
  value       = azurerm_resource_group.terraform_resource_group.id
}
output "resource_group_location" {
  description = "Location of the resource group"
  value       = azurerm_resource_group.terraform_resource_group.location //This value we can also use as the location of all other resources
}