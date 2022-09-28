#Resource to create db tier subnet
resource "azurerm_subnet" "db_tier_subnet" {
  name                 = "${local.owner}-${local.division}-${local.environment}-TerraformdbSubnet"
  resource_group_name  = azurerm_resource_group.terraform_rg.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = var.db_tier_address_prefixes
}

#Resource to create db tier NSG
resource "azurerm_network_security_group" "db_tier_subnet_nsg" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformdbSubnetNsg"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformdbSubnetNsg"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Cost_center" = "${local.cost_center}"
  }
}

#Resource to create association between nsg and subnet
resource "azurerm_subnet_network_security_group_association" "attachment_db_tier_nsg_subnet" {
  subnet_id                 = azurerm_subnet.db_tier_subnet.id
  network_security_group_id = azurerm_network_security_group.db_tier_subnet_nsg.id
  depends_on = [
    azurerm_network_security_group.db_tier_subnet_nsg
  ]
}

#Resource to create NSG rules
resource "azurerm_network_security_rule" "db_tier_nsg_rule" {
  for_each                    = local.db_subnet_inbound_ports
  name                        = "Allow-port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.terraform_rg.name
  network_security_group_name = azurerm_network_security_group.db_tier_subnet_nsg.name
}