#LBresource
resource "azurerm_lb" "azure_standard_lb" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformLb"
  location            = azurerm_resource_group.terraform_resourcegrp.location
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name
  sku                 = var.lb_sku

  frontend_ip_configuration {
    name                 = "${local.owner}-${local.division}-${local.environment}-TerraformLbFronteEndIpConf"
    public_ip_address_id = azurerm_public_ip.standard_lb_pip.id
  }
}

#Backend pool
resource "azurerm_lb_backend_address_pool" "azure_lb_backend_pool" {
  loadbalancer_id = azurerm_lb.azure_standard_lb.id
  name            = "${local.owner}-${local.division}-${local.environment}-TerraformLbBackEndAddressPool"
}

#probe
resource "azurerm_lb_probe" "azure_lb_probe" {
  loadbalancer_id = azurerm_lb.azure_standard_lb.id
  name            = "${local.owner}-${local.division}-${local.environment}-TerraformLb-ssh-running-probe"
  port            = 80
}

#https rule
resource "azurerm_lb_rule" "standard_lb_rule" {
  name                           = "${local.owner}-${local.division}-${local.environment}-TerraformLBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.azure_standard_lb.frontend_ip_configuration[0].id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.azure_lb_backend_pool.id
  probe_id                       = azurerm_lb_probe.azure_lb_probe.id
  loadbalancer_id                = azurerm_lb.azure_standard_lb.id
  resource_group_name            = azurerm_resource_group.terraform_resourcegrp.name
}

#Backend pool and nic association
resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_association" {
  for_each                = var.web_linux_ports
  network_interface_id    = azurerm_network_interface.web_linux_nic[each.key].id
  ip_configuration_name   = azurerm_network_interface.web_linux_nic[each.key].ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.azure_lb_backend_pool.id
}