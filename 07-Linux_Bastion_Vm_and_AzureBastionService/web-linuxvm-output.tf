#Web Linux VM output 
output "web_linux_vm_name" {
  description = "Name of the web linux Vm"
  value       = azurerm_linux_virtual_machine.web_linux_vm.name
}
output "web_linux_vm_id" {
  description = "ID of the web Linux Vm "
  value       = azurerm_linux_virtual_machine.web_linux_vm.id
}
output "web_linux_vm_public_ip_address" {
  description = "Public IP of the web Vm"
  value       = azurerm_linux_virtual_machine.web_linux_vm.public_ip_address
}
output "web_linux_vm_virtual_machine_id" {
  description = "A 128-bit identifier which uniquely identifies this Virtual Machine"
  value       = azurerm_linux_virtual_machine.web_linux_vm.virtual_machine_id
}
