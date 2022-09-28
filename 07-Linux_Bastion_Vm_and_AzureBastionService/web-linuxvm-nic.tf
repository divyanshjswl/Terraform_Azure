resource "azurerm_network_interface" "web_linuxvm_nic" {
  name                = "${local.owner}-${local.division}-${local.environment}-WebLinuxVmNic"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name

  ip_configuration {
    name                          = "WebLinuxVmNicPrivIP"
    subnet_id                     = azurerm_subnet.web_tier_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}