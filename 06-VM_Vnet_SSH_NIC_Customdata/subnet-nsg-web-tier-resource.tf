#Resource to create web tier Subnet
resource "azurerm_subnet" "web_tier_subnet" {
  name                 = "${local.owner}-${local.division}-${local.environment}-webTierSubnet"
  resource_group_name  = azurerm_resource_group.terraform_rg.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = var.web_tier_address_prefixes
}


#Resource to create web tier NSG
resource "azurerm_network_security_group" "web_tier_nsg" {
  name                = "${local.owner}-${local.division}-${local.environment}-webTierNSg"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-webTierNSg"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Cost_center" = "${local.cost_center}"
    "Environment" = "${local.environment}"
  }

}

#Resource to create association between NSG and Subnet
resource "azurerm_subnet_network_security_group_association" "attachment_with_web_tier" {
  subnet_id                 = azurerm_subnet.web_tier_subnet.id
  network_security_group_id = azurerm_network_security_group.web_tier_nsg.id
  depends_on = [
    azurerm_network_security_rule.web_tier_nsg_rule
  ]
}

#Resource to create NSG Rules
resource "azurerm_network_security_rule" "web_tier_nsg_rule" {
  for_each                    = local.web_tier_nsg_ports
  name                        = "Allow-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.terraform_rg.name
  network_security_group_name = azurerm_network_security_group.web_tier_nsg.name
}