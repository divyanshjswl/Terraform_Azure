#Resource to create app tier subnet
resource "azurerm_subnet" "app_tier_subnet" {
  name                 = "${local.owner}-${local.division}-${local.environment}-TerraformappSubnet"
  resource_group_name  = azurerm_resource_group.terraform_rg.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = var.app_tier_address_prefixes
}

#Resource to create app tier NSG
resource "azurerm_network_security_group" "app_tier_subnet_nsg" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformappSubnetNsg"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformappSubnetNsg"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Cost_center" = "${local.cost_center}"
  }
}

#Resource to create association between nsg and subnet
resource "azurerm_subnet_network_security_group_association" "attachment_app_tier_nsg_subnet" {
  subnet_id                 = azurerm_subnet.app_tier_subnet.id
  network_security_group_id = azurerm_network_security_group.app_tier_subnet_nsg.id
  depends_on = [
    azurerm_network_security_group.app_tier_subnet_nsg
  ]
}

#Resource to create NSG rules
resource "azurerm_network_security_rule" "app_tier_nsg_rule" {
  for_each                    = local.app_subnet_inbound_ports
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
  network_security_group_name = azurerm_network_security_group.app_tier_subnet_nsg.name
}