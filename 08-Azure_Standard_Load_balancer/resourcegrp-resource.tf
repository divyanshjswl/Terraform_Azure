resource "azurerm_resource_group" "terraform_resourcegrp" {
name = "${local.owner}-${local.division}-${local.environment}-TerraformResourceGrp-${random_string.randomname.id}"
location = var.location
tags = {
  "Name" = "${local.owner}-${local.division}-${local.environment}-TerraformResourceGrp-${random_string.randomname.id}"
  "Owner" = "${local.owner}"
  "Division" = "${local.division}"
  "Environment" = "${local.environment}"
  "Cost_center" = "${local.cost_center}"
}
}