resource "azurerm_public_ip" "bastion_linuxvm_pip" {
  name                = "${local.owner}-${local.division}-${local.environment}-BastionLinuxVmPip"
  resource_group_name = azurerm_resource_group.terraform_rg.name
  location            = azurerm_resource_group.terraform_rg.location
  allocation_method   = var.bastion_linux_vm_pip_allocation_method
  sku                 = "Standard"
}