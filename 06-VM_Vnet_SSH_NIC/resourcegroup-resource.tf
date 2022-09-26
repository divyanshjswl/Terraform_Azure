resource "azurerm_resource_group" "terraform_rg" {
  name     = "${local.owner}-${local.division}-${local.environment}-${var.resourcegrp_endname}-${random_string.randomname.id}"
  location = var.resource_location //we will use this for all resource location
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-${var.resourcegrp_endname}-${random_string.randomname.id}"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Cost_center" = "${local.cost_center}"
    "Environment" = "${local.environment}"
  }
}