#For creating the resource for subnet
resource "azurerm_subnet" "app_tier_subnet" {
  name                 = "${local.owner}-${local.division}-${local.environment}-${var.app_tier_subnet_end_name}"
  resource_group_name  = azurerm_resource_group.terraform_resource_group.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = var.app_tier_address_prefixes
}

#For creating resource for App tier subnet NSG
resource "azurerm_network_security_group" "app_tier_nsg" {
  name                = "${local.owner}-${local.division}-${local.environment}-${var.app_tier_nsg_end_name}"
  location            = azurerm_resource_group.terraform_resource_group.location
  resource_group_name = azurerm_resource_group.terraform_resource_group.name
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-${var.app_tier_nsg_end_name}"
    "Owner"       = "${local.division}"
    "Division"    = "${local.division}"
    "Ënvironment" = "${local.environment}"
  }
}

#resource for creating association between NSg and subnet
resource "azurerm_subnet_network_security_group_association" "attachment_with_app_tier" {
  subnet_id                 = azurerm_subnet.app_tier_subnet.id
  network_security_group_id = azurerm_network_security_group.app_tier_nsg.id
  depends_on = [
    azurerm_network_security_rule.app_tier_inbound_rule
  ]
}

#resource for creating nsg rules 
resource "azurerm_network_security_rule" "app_tier_inbound_rule" {
  for_each                    = local.app_tier_inbound_rule_map
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
  network_security_group_name = azurerm_network_security_group.app_tier_nsg.name
}