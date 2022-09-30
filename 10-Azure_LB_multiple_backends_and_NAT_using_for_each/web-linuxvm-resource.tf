resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  for_each              = var.web_linux_ports
  name                  = "${local.owner}-${local.division}-${local.environment}-TerraformLinuxVm-${each.key}"
  resource_group_name   = azurerm_resource_group.terraform_resourcegrp.name
  location              = azurerm_resource_group.terraform_resourcegrp.location
  size                  = var.web_linuxvm_size
  admin_username        = "terraformuser"
  network_interface_ids = [azurerm_network_interface.web_linux_nic[each.key].id]
  custom_data           = filebase64("${path.module}/custom-data/userdata.sh")

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