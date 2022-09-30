#Web Linux VM NIC
output "web_linux_vm_nic_id" {
  description = "List of NIC IDs"
  value       = { for nic in azurerm_network_interface.web_linux_nic : nic.name => nic.id }

}

#Web Linux VM 
output "web_linuxvm_id" {
  description = "List of Vms IDs"
  value       = { for servers in azurerm_linux_virtual_machine.web_linuxvm : servers.name => servers.id }
}
output "web_linuxvm_private_ip_address" {
  description = "List of private IPs of web Linux vms"
  value       = { for servers in azurerm_linux_virtual_machine.web_linuxvm : servers.name => servers.private_ip_address }
}
