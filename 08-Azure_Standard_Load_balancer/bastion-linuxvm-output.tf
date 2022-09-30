#nic
output "bastion_linux_vm_nic_id" {
    description = "value"
    value = azurerm_network_interface.bastion_linux_vm_nic.id
}
#############################################################################
#pip
output "bastion_linux_vm_pip_id" {
    description = "value"
    value = azurerm_public_ip.bastion_linux_vm_pip.id
}
output "bastion_linux_vm_pip_ip_address" {
    description = "value"
    value = azurerm_public_ip.bastion_linux_vm_pip.ip_address
}
############################################################################
#vm
output "bastion_linux_vm_id" {
    description = "value"
    value = azurerm_linux_virtual_machine.bastion_linux_vm.id
}
output "bastion_linux_vm_private_ip_address" {
    description = "value"
    value = azurerm_linux_virtual_machine.bastion_linux_vm.private_ip_address
}
output "bastion_linux_vm_public_ip_address" {
    description = "value"
    value = azurerm_linux_virtual_machine.bastion_linux_vm.public_ip_address
}
output "bastion_linux_vm_virtual_machine_id" {
    description = "value"
    value = azurerm_linux_virtual_machine.bastion_linux_vm.virtual_machine_id
}
