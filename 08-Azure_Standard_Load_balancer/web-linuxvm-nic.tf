resource "azurerm_network_interface" "web_linuxvm_nic" {
  name                = "${local.owner}-${local.division}-${local.environment}-WebLinuxVmNic"
  location            = azurerm_resource_group.terraform_resourcegrp.location
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name

  ip_configuration {
    name                          = "${local.owner}-${local.division}-${local.environment}-WebLinuxVmNicIpConf"
    subnet_id                     = azurerm_subnet.web_tier_subnet.id
    private_ip_address_allocation = var.web_linuxvm_private_ip_address_allocation
  }  
}