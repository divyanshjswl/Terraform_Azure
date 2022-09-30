resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  name                = "${local.owner}-${local.division}-${local.environment}-WebLinuxVm"
  resource_group_name = azurerm_resource_group.terraform_resourcegrp.name
  location            = azurerm_resource_group.terraform_resourcegrp.location
  size                = "Standard_DS1_v2"
  admin_username      = "terraformuser"
  custom_data = filebase64("${path.module}/custom-data/userdata.sh")
  network_interface_ids = [
    azurerm_network_interface.web_linuxvm_nic.id,
  ]

  admin_ssh_key {
    username   = "terraform"
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
    "Name" = "${local.owner}-${local.division}-${local.environment}-WebLinuxVm"
    "Owner" = "${local.owner}"
    "Division" = "${local.division}"
    "Environment" = "${local.environment}"
    "Cost_center" = "${local.cost_center}"
  }
}