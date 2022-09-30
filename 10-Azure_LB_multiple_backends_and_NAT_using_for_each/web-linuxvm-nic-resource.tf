resource "azurerm_network_interface" "web_linux_nic" {
  for_each            = var.web_linux_ports
  name                = "${local.owner}-${local.division}-${local.environment}TerraformWebLinux-${each.key}"
  location            = azurerm_resource_group.terraform_resourcegrp.location
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name

  ip_configuration {
    name                          = "${local.owner}-${local.division}-${local.environment}TerraformWebLinuxIpConf"
    subnet_id                     = azurerm_subnet.web_tier_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}