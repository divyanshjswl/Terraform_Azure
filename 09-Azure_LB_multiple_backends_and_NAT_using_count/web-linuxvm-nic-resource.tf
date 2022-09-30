resource "azurerm_network_interface" "web_linuxvm_nic" {
  count               = var.resource_count
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformWebLinuxNic-${count.index}"
  location            = azurerm_resource_group.terraform_resourcegrp.location
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name

  ip_configuration {
    name                          = "${local.owner}-${local.division}-${local.environment}-TerraformWebLinuxNicIpConf"
    subnet_id                     = azurerm_subnet.web_tier_subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformWebLinuxNic-${count.index}"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Environment" = "${local.environment}"
    "Cost_center" = "${local.cost_center}"
  }
}