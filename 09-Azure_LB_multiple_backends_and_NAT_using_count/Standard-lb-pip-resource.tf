resource "azurerm_public_ip" "azure_load_balancer_pip" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformAzureLbPip-${random_string.randomnames.id}"
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name
  location            = azurerm_resource_group.terraform_resourcegrp.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformAzureLbPip-${random_string.randomnames.id}"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Environment" = "${local.environment}"
    "Cost_center" = "${local.cost_center}"
  }
}