resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  name                  = "${local.owner}-${local.division}-${local.environment}-WebLinuxVm"
  resource_group_name   = azurerm_resource_group.terraform_rg.name
  location              = azurerm_resource_group.terraform_rg.location
  size                  = "Standard_DS1_v2"
  admin_username        = "terraformuser"
  network_interface_ids = [azurerm_network_interface.web_linux_vm_nic.id]
  #custom_data = filebase64("${path.module}/custom-data/userdata.sh") // we can use this method as well as local.tf method
  custom_data = base64encode(local.web_linux_custom_data) //Check local.tf for user data details

  admin_ssh_key {
    username   = "terraformuser"
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