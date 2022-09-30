#Bastion Linux Vm Nic
output "bastion_linuxvm_nic_id" {
  description = "ID of the bastion Linux vm Nic card"
  value       = azurerm_network_interface.bastion_linuxvm_nic.id
}


#Bastion Linux VM
output "bastion_linux_vm_id" {
  description = "ID of the bastion Linux Vm"
  value       = azurerm_linux_virtual_machine.bastion_linuxvm.id
}
output "bastion_linuxvm_private_ip_address" {
  description = "Private ip address of the bastion Linux vm "
  value       = azurerm_linux_virtual_machine.bastion_linuxvm.private_ip_address
}
output "bastion_linuxvm_public_ip_address" {
  description = "Public ip address of the bastion Linux vm"
  value       = azurerm_linux_virtual_machine.bastion_linuxvm.public_ip_address
}