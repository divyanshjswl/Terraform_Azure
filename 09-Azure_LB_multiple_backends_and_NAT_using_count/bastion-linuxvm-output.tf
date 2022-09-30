output "bastion_linuxvm_id" {
  description = "The ID of the Linux Virtual Machine"
  value       = azurerm_linux_virtual_machine.bastion_linuxvm.id
}
output "bastion_linuxvm_private_ip_address" {
  description = "The Primary Private IP Address assigned to this Virtual Machine"
  value       = azurerm_linux_virtual_machine.bastion_linuxvm.private_ip_address

}
output "bastion_linuxvm_public_ip_address" {
  description = "The Primary Public IP Address assigned to this Virtual Machine"
  value       = azurerm_linux_virtual_machine.bastion_linuxvm.public_ip_address
}
output "bastion_linuxvm_virtual_machine_id" {
  description = "A 128-bit identifier which uniquely identifies this Virtual Machine"
  value       = azurerm_linux_virtual_machine.bastion_linuxvm.virtual_machine_id
}