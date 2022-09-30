#web_linuxvm_nic
output "web_linuxvm_nic_id" {
  description = "ID of the Linux Vm"
  value       = azurerm_network_interface.web_linuxvm_nic[*].id
}
output "web_linuxvm_private_ip_address" {
  description = "value"
  value       = azurerm_network_interface.web_linuxvm_nic[*].private_ip_address
}


#LinuxVm
output "web_linux_vm_id" {
  description = "The ID of the Linux Virtual Machine"
  value       = azurerm_linux_virtual_machine.web_linux_vm[*].id
}
output "web_linux_vm_private_ip_address" {
  description = "The Primary Private IP Address assigned to this Virtual Machine"
  value       = azurerm_linux_virtual_machine.web_linux_vm[*].private_ip_address
}
output "web_linux_vm_virtual_machine_id" {
  description = "A 128-bit identifier which uniquely identifies this Virtual Machine"
  value       = azurerm_linux_virtual_machine.web_linux_vm[*].virtual_machine_id
}