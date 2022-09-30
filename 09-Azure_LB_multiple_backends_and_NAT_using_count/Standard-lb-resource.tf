#LB resource
resource "azurerm_lb" "azure_lb" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformLb"
  location            = azurerm_resource_group.terraform_resourcegrp.location
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name
  sku                 = var.lb_sku

  frontend_ip_configuration {
    name                 = "${local.owner}-${local.division}-${local.environment}-TerraformLbFronteEndIpConf"
    public_ip_address_id = azurerm_public_ip.azure_load_balancer_pip.id
  }
}

#backend pool
resource "azurerm_lb_backend_address_pool" "azure_lb_backend_pool" {
  loadbalancer_id = azurerm_lb.azure_lb.id
  name            = "${local.owner}-${local.division}-${local.environment}-TerraformLbBackEndAddressPool"
}

#Lb probe
resource "azurerm_lb_probe" "azure_lb_probe" {
  loadbalancer_id = azurerm_lb.azure_lb.id
  name            = "${local.owner}-${local.division}-${local.environment}-TerraformLb-ssh-running-probe"
  port            = 80
}

#Lb rule
resource "azurerm_lb_rule" "azure_lb_rule" {
  loadbalancer_id                = azurerm_lb.azure_lb.id
  name                           = "${local.owner}-${local.division}-${local.environment}-TerraformLBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.azure_lb.frontend_ip_configuration[0].id
  probe_id                       = azurerm_lb_probe.azure_lb_probe.id
}

#Associate Network Interface and Standard Load Balancer
resource "azurerm_network_interface_backend_address_pool_association" "azure_lb_nic_association" {
  count                   = var.resource_count
  network_interface_id    = element(azurerm_network_interface.web_linuxvm_nic[*].id, count.index)
  ip_configuration_name   = element(azurerm_network_interface.web_linuxvm_nic[*], count.index).ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.azure_lb_backend_pool.id
}