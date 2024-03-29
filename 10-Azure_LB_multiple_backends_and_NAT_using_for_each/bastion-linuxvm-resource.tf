resource "azurerm_linux_virtual_machine" "bastion_linuxvm" {
  name                  = "${local.owner}-${local.division}-${local.environment}-TerraformBastionLinuxVm"
  resource_group_name   = azurerm_resource_group.terraform_resourcegrp.name
  location              = azurerm_resource_group.terraform_resourcegrp.location
  size                  = "Standard_DS1_v2"
  admin_username        = var.bastion_linux_vm_admin_username
  network_interface_ids = [azurerm_network_interface.bastion_linuxvm_nic.id]

  admin_ssh_key {
    username   = var.bastion_linux_vm_admin_username
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
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformBastionLinuxVm"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Environment" = "${local.environment}"
    "Cost_center" = "${local.cost_center}"
  }
}