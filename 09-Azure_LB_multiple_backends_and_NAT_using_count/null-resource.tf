resource "null_resource" "nullname" {
  depends_on = [azurerm_linux_virtual_machine.bastion_linuxvm]
  connection {
    type        = "ssh"
    host        = azurerm_linux_virtual_machine.bastion_linuxvm.public_ip_address
    private_key = file("${path.module}/ssh-keys/terraform-azure.pub")
    user        = azurerm_linux_virtual_machine.bastion_linuxvm.admin_username
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