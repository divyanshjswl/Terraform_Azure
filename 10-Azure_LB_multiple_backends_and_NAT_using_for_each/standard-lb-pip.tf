resource "azurerm_public_ip" "standard_lb_pip" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformStandardLbPip-${random_string.randomname.id}"
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name
  location            = azurerm_resource_group.terraform_resourcegrp.location
  allocation_method   = "Static"
  sku                 = "Standard"
}