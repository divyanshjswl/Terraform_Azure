output "resource_grp_name" {
    description = "Name of the Resource Group"
    value = azurerm_resource_group.terraform_resourcegrp.name
}
output "resource_grp_location" {
    description = "Location of the Resource Group"
    value = azurerm_resource_group.terraform_resourcegrp.location
}