resource "azurerm_linux_virtual_machine" "web_linux_vm" {
  count                 = var.resource_count
  name                  = "${local.owner}-${local.division}-${local.environment}-TerraformWebLinuxVm-${count.index}"
  resource_group_name   = azurerm_resource_group.terraform_resourcegrp.name
  location              = azurerm_resource_group.terraform_resourcegrp.location
  size                  = "Standard_DS1_v2"
  admin_username        = "terraformuser"
  network_interface_ids = [element(azurerm_network_interface.web_linuxvm_nic[*].id, count.index)]
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
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformWebLinuxVm-${count.index}"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Environment" = "${local.environment}"
    "Cost_center" = "${local.cost_center}"
  }
}
