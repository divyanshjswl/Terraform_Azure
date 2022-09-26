## Public IP Address
/*
output "web_linuxvm_pip_public_ip" {
  description = "Public IP"
  value       = azurerm_public_ip.web_linuxvm_pip.ip_address
}
*/

#Network Interface Outputs
output "web_linuxvm_nic_id" {
  description = "ID of the NIC card"
  value       = azurerm_network_interface.web_linux_vm_nic.id
}
output "web_linuxvm_nic_private_ip" {
  description = "Private IP of the NIC card"
  value       = azurerm_network_interface.web_linux_vm_nic.private_ip_address
}

#LnuxVm output
output "web_linuxvm_id" {
  description = "The ID of the Linux Virtual Machine"
  value       = azurerm_linux_virtual_machine.web_linuxvm.id
}
/*
output "web_linuxvm_private_ip_address" {
  description = "The Primary Private IP Address assigned to this Virtual Machine"
  value       = azurerm_linux_virtual_machine.web_linuxvm.ip_address
}
*/
output "web_linuxvm_public_ip_address" {
  description = "The Primary Public IP Address assigned to this Virtual Machine"
  value       = azurerm_linux_virtual_machine.web_linuxvm.public_ip_address
}
output "web_linuxvm_virtual_machine_id" {
  description = "A 128-bit identifier which uniquely identifies this Virtual Machine"
  value       = azurerm_linux_virtual_machine.web_linuxvm.virtual_machine_id
}