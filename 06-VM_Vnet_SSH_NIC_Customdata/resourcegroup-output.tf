output "resourcegrp_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.terraform_rg.name
}
output "resourcegrp_location" {
  description = "Location of the Resource Group"
  value       = azurerm_resource_group.terraform_rg.location
}