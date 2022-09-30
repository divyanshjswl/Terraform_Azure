resource "azurerm_lb_nat_rule" "standard_lb_nat" {
  depends_on                     = [azurerm_linux_virtual_machine.web_linuxvm]
  for_each                       = var.web_linux_ports
  name                           = "${local.owner}-${local.division}-${local.environment}-TerraformNat-${each.value}-to-22"
  protocol                       = "Tcp"
  frontend_port                  = each.value
  backend_port                   = 22
  frontend_ip_configuration_name = azurerm_lb.azure_standard_lb.frontend_ip_configuration[0].name
  resource_group_name            = azurerm_resource_group.terraform_resourcegrp.name
  loadbalancer_id                = azurerm_lb.azure_standard_lb.id
}

# Associate LB NAT Rule and VM Network Interface
resource "azurerm_network_interface_nat_rule_association" "standard_lb_nat_rule_association" {
  for_each              = var.web_linux_ports
  network_interface_id  = azurerm_network_interface.web_linux_nic[each.key].id
  ip_configuration_name = azurerm_network_interface.web_linux_nic[each.key].ip_configuration[0].name
  nat_rule_id           = azurerm_lb_nat_rule.standard_lb_nat[each.key].id
}