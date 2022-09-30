#Nic
output "web_linux_vm_nic_id" {
    description = "value"
    value = azurerm_network_interface.web_linuxvm_nic.id
}
output "web_linux_vm_nic_private_ip_address" {
    description = "value"
    value = azurerm_network_interface.web_linuxvm_nic.private_ip_address
}
#########################################################################################################
#Vm 
output "web_linux_vm_id" {
    description = "value"
    value = azurerm_linux_virtual_machine.web_linuxvm.id
}
output "web_linux_vm_private_ip_address" {
    description = "value"
    value = azurerm_linux_virtual_machine.web_linuxvm.private_ip_address
}
output "web_linux_vm_private_virtual_machine_id" {
    description = "value"
    value = azurerm_linux_virtual_machine.web_linuxvm.virtual_machine_id
}