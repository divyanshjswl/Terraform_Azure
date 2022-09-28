#Bastion VM output 
output "bastion_linux_vm_name" {
  description = "Name of the bastion linux Vm"
  value       = azurerm_linux_virtual_machine.bastion_linux_vm.name
}
output "bastion_linux_vm_id" {
  description = "ID of the Bastion Linux Vm "
  value       = azurerm_linux_virtual_machine.bastion_linux_vm.id
}
output "bastion_linux_vm_public_ip_address" {
  description = "Public IP of the Bastion Vm"
  value       = azurerm_linux_virtual_machine.bastion_linux_vm.public_ip_address
}
output "bastion_linux_vm_virtual_machine_id" {
  description = "A 128-bit identifier which uniquely identifies this Virtual Machine"
  value       = azurerm_linux_virtual_machine.bastion_linux_vm.virtual_machine_id
}
