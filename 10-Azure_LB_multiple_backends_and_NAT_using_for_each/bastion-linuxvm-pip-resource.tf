resource "azurerm_public_ip" "bastion_linuxvm_pip" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformBastionVmPip-${random_string.randomname.id}"
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name
  location            = azurerm_resource_group.terraform_resourcegrp.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformBastionVmPip-${random_string.randomname.id}"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Environment" = "${local.environment}"
    "Cost_center" = "${local.cost_center}"
  }
}