resource "azurerm_public_ip" "azure_lb_public_ip" {
  name                = "${local.owner}-${local.division}-${local.environment}-AzureLbPip-${random_string.randomname.id}"
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name
  location            = azurerm_resource_group.terraform_resourcegrp.location
  allocation_method   = "Static"
  sku = "Standard"
}