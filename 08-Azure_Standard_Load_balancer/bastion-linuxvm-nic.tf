resource "azurerm_network_interface" "bastion_linux_vm_nic" {
  name                = "${local.owner}-${local.division}-${local.environment}-BastionLinuxVmNic"
  location            = azurerm_resource_group.terraform_resourcegrp.location
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name

  ip_configuration {
    name                          = "${local.owner}-${local.division}-${local.environment}-BastionLinuxVmNicIpConf"
    subnet_id                     = azurerm_subnet.bastion_tier_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.bastion_linux_vm_pip.id
  }  
}