resource "azurerm_lb_nat_rule" "terraform_lb_nat_rule" {
  depends_on = [azurerm_linux_virtual_machine.web_linux_vm]
  count                          = var.resource_count
  name                           = "${local.owner}-${local.division}-${local.environment}-TerraformLbNAT-${count.index}"
  protocol                       = "Tcp"
  frontend_port                  = element(var.lb_frontend_ports_for_rdp, count.index)
  backend_port                   = 22
  frontend_ip_configuration_name = azurerm_lb.azure_lb.frontend_ip_configuration[0].name
  resource_group_name            = azurerm_resource_group.terraform_resourcegrp.name
  loadbalancer_id                = azurerm_lb.azure_lb.id
}


resource "azurerm_network_interface_nat_rule_association" "web_nic_nat_rule_association" {
  count                 = var.resource_count
  network_interface_id  = element(azurerm_network_interface.web_linuxvm_nic[*].id, count.index)
  ip_configuration_name = element(azurerm_network_interface.web_linuxvm_nic[*].ip_configuration[0].name, count.index)
  nat_rule_id           = element(azurerm_lb_nat_rule.terraform_lb_nat_rule[*].id, count.index)
}