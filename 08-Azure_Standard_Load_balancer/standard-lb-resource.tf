#Create Azure Standard Load Balancer
resource "azurerm_lb" "azure_standard_load_balancer" {
  name                = "${local.owner}-${local.division}-${local.environment}-AzureLb"
  location            = azurerm_resource_group.terraform_resourcegrp.location
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name
  sku = var.azure_lb_sku

  frontend_ip_configuration {
    name                 = "${local.owner}-${local.division}-${local.environment}-AzureLbFrontendIpConf"
    public_ip_address_id = azurerm_public_ip.azure_lb_public_ip.id
  }
}


#Create LB Backend Pool
resource "azurerm_lb_backend_address_pool" "azure_lb_backend_pool" {
  loadbalancer_id = azurerm_lb.azure_standard_load_balancer.id
  name            = "${local.owner}-${local.division}-${local.environment}BackEndAddressPool"
}


#Create LB Probe
resource "azurerm_lb_probe" "azure_lb_probe" {
  loadbalancer_id = azurerm_lb.azure_standard_load_balancer.id
  name            = "${local.owner}-${local.division}-${local.environment}-AzureLbProbe"
  port            = 80
}

#Create LB Rule
resource "azurerm_lb_rule" "azure_lb_rule" {
  name                           = "${local.owner}-${local.division}-${local.environment}-TerraformLBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.azure_standard_load_balancer.frontend_ip_configuration[0].id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.azure_lb_backend_pool.id
  probe_id                       = azurerm_lb_probe.azure_lb_probe.id
  loadbalancer_id                = azurerm_lb.azure_standard_load_balancer.id
  resource_group_name            = azurerm_resource_group.terraform_resourcegrp.name
}

#Associate Network Interface and Standard Load Balancer
resource "azurerm_network_interface_backend_address_pool_association" "azure_lb_add_vm_to_backend_pool" {
  network_interface_id    = azurerm_network_interface.web_linuxvm_nic.id
  ip_configuration_name   = azurerm_lb.azure_standard_load_balancer.frontend_ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.azure_lb_backend_pool.id
}