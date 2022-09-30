#Subnet
resource "azurerm_subnet" "app_tier_subnet" {
  name                 = "${local.owner}-${local.division}-${local.environment}-TerraformappSubnet"
  resource_group_name  = azurerm_resource_group.terraform_resourcegrp.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = var.app_tier_address_prefixes
}

#NSG
resource "azurerm_network_security_group" "app_tier_nsg" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformappSubnetNsg"
  location            = azurerm_resource_group.terraform_resourcegrp.location
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformappSubnetNsg"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Environment" = "${local.environment}"
    "Cost_center" = "${local.cost_center}"
  }
}

#Subnet NSG Association
resource "azurerm_subnet_network_security_group_association" "attachment_with_app_tier_nsg" {
  subnet_id                 = azurerm_subnet.app_tier_subnet.id
  network_security_group_id = azurerm_network_security_group.app_tier_nsg.id
  depends_on = [
    azurerm_network_security_rule.app_tier_nsg_rule
  ]
}

#NSG Rules
resource "azurerm_network_security_rule" "app_tier_nsg_rule" {
  for_each                    = local.app_nsg_inbound_ports
  name                        = "Allow-port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.terraform_resourcegrp.name
  network_security_group_name = azurerm_network_security_group.app_tier_nsg.name
}