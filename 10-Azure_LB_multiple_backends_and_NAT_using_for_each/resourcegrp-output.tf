output "resourcegrp_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.terraform_resourcegrp.name
}

output "resourcegrp_location" {
  description = "Location of the resourcegroup"
  value       = azurerm_resource_group.terraform_resourcegrp.location
}