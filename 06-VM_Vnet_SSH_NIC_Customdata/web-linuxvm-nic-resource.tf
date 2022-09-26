resource "azurerm_network_interface" "web_linux_vm_nic" {
  name                = "${local.owner}-${local.division}-${local.environment}-WebLinuxVmNic"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name

  ip_configuration {
    name                          = "web-linux-vm-ip-1"
    subnet_id                     = azurerm_subnet.web_tier_subnet.id
    private_ip_address_allocation = var.web_linux_vm_nic_private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.web_linuxvm_pip.id
  }
}