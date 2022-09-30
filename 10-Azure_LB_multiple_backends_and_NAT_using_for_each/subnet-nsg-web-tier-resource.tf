#subnet
resource "azurerm_subnet" "web_tier_subnet" {
  name                 = "${local.owner}-${local.division}-${local.environment}-TerraformwebSubnet"
  resource_group_name  = azurerm_resource_group.terraform_resourcegrp.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = var.web_tier_subnet_address_prefixes
}

#nsg
resource "azurerm_network_security_group" "web_tier_subnet_nsg" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformwebSubnetNsg"
  location            = azurerm_resource_group.terraform_resourcegrp.location
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformwebSubnetNsg"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Environment" = "${local.environment}"
    "Cost_center" = "${local.cost_center}"
  }
}

#subnet nsg association
resource "azurerm_subnet_network_security_group_association" "nsg_attachment_with_web_tier_subnet" {
  subnet_id                 = azurerm_subnet.web_tier_subnet.id
  network_security_group_id = azurerm_network_security_group.web_tier_subnet_nsg.id
  depends_on = [
    azurerm_network_security_rule.web_tier_nsg_rule
  ]
}


#nsg rule
resource "azurerm_network_security_rule" "web_tier_nsg_rule" {
  for_each                    = local.web_tier_inbound_ports
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
  network_security_group_name = azurerm_network_security_group.web_tier_subnet_nsg.name
}