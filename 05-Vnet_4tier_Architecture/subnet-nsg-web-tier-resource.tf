#Resource for creating the web tier subnet
resource "azurerm_subnet" "web_tier_subnet" {
  name                 = "${local.owner}-${local.division}-${local.environment}-${var.websubnet_end_name}"
  resource_group_name  = azurerm_resource_group.terraform_resource_group.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = var.web_tier_address_prefixes
}

#Resource for creating web tier Nsg
resource "azurerm_network_security_group" "web_tier_nsg" {
  name                = "${local.owner}-${local.division}-${local.environment}-${var.web_tier_nsg_end_name}"
  location            = azurerm_resource_group.terraform_resource_group.location
  resource_group_name = azurerm_resource_group.terraform_resource_group.name
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-${var.web_tier_nsg_end_name}"
    "Owner"       = "${local.division}"
    "Division"    = "${local.division}"
    "Ënvironment" = "${local.environment}"
  }
}

#Resource for creating association of nsg with subnet
resource "azurerm_subnet_network_security_group_association" "attachment_with_web_tier" {
  subnet_id                 = azurerm_subnet.web_tier_subnet.id
  network_security_group_id = azurerm_network_security_group.web_tier_nsg.id
  depends_on = [
    azurerm_network_security_rule.web_tier_inbound_rule
  ]
}

#Resource for creating rules for nsg -  here we have multiple rules so instead of creating the multiple rules block we will use for_each and refer the values from local.tf
resource "azurerm_network_security_rule" "web_tier_inbound_rule" {
  for_each                    = local.web_tier_inbound_rule_map
  name                        = "Allow_Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.terraform_resource_group.name
  network_security_group_name = azurerm_network_security_group.web_tier_nsg.name
}