resource "azurerm_network_security_group" "web_linux_vm_nic_nsg" {

  name                = "${local.owner}-${local.division}-${local.environment}-WebLinuxVmNicNsg"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-WebLinuxVmNicNsg"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Cost_center" = "${local.cost_center}"
    "Environment" = "${local.environment}"
  }
}

#WebLinuxVmNicNsg association with VM nic
resource "azurerm_network_interface_security_group_association" "attachment_web_linux_vm_nic_with_nsg" {
  network_interface_id      = azurerm_network_interface.web_linux_vm_nic.id
  network_security_group_id = azurerm_network_security_group.web_linux_vm_nic_nsg.id
  depends_on = [
    azurerm_network_security_rule.web_linuxvm_nic_nsg_rule
  ]
}

#WebLinuxVmNicNsg NSG rules 
resource "azurerm_network_security_rule" "web_linuxvm_nic_nsg_rule" {
  for_each                    = local.web_linuxvm_nic_nsg_ports
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
  network_security_group_name = azurerm_network_security_group.web_linux_vm_nic_nsg.name
}
