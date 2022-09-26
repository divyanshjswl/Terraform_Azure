resource "azurerm_public_ip" "web_linuxvm_pip" {
  name                = "${local.owner}-${local.division}-${local.environment}-WebLinuxPip"
  resource_group_name = azurerm_resource_group.terraform_rg.name
  location            = azurerm_resource_group.terraform_rg.location
  allocation_method   = var.weblinuxvm_pip_allocation_method
  sku                 = var.weblinuxvm_pip_sku
  domain_name_label   = "app1-vm-${random_string.randomname.id}"
}