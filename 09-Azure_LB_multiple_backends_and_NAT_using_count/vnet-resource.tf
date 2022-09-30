resource "azurerm_virtual_network" "terraform_vnet" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformVnet"
  location            = azurerm_resource_group.terraform_resourcegrp.location
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name
  address_space       = var.vnet_address_space
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformVnet"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Environment" = "${local.environment}"
    "Cost_center" = "${local.cost_center}"
  }
}