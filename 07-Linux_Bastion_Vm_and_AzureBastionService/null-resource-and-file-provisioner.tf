resource "null_resource" "null_name" {
  depends_on = [azurerm_linux_virtual_machine.bastion_linux_vm]
  connection {
    type        = "ssh"
    host        = azurerm_linux_virtual_machine.bastion_linux_vm.public_ip_address
    user        = azurerm_linux_virtual_machine.bastion_linux_vm.admin_username
    private_key = file("${path.module}/ssh-keys/terraform-azure.pem")
  }
  provisioner "file" {
    source      = "ssh-keys/terraform-azure.pem"
    destination = "/tmp/terraform-azure.pem"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-azure.pem"
    ]
  }
}