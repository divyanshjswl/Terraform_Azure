resource "azurerm_linux_virtual_machine" "web_linux_vm" {
  name                = "${local.owner}-${local.division}-${local.environment}-WebLinuxVm"
  resource_group_name = azurerm_resource_group.terraform_rg.name
  location            = azurerm_resource_group.terraform_rg.location
  size                = "Standard_DS1_v2"
  admin_username      = var.web_linux_vm_admin_username
  custom_data         = base64encode(local.web_linux_vm_custom_data)
  network_interface_ids = [
    azurerm_network_interface.web_linuxvm_nic.id
  ]

  admin_ssh_key {
    username   = var.web_linux_vm_admin_username
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
}