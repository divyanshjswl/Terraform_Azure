resource "azurerm_network_interface" "bastion_linuxvm_nic" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformBastionLinuxVmNic"
  location            = azurerm_resource_group.terraform_resourcegrp.location
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name

  ip_configuration {
    name                          = "${local.owner}-${local.division}-${local.environment}-TerraformBastionLinuxVmNicIpConf"
    subnet_id                     = azurerm_subnet.bastion_tier_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastion_linuxvm_pip.id
  }
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformBastionLinuxVmNic"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Environment" = "${local.environment}"
    "Cost_center" = "${local.cost_center}"
  }
}