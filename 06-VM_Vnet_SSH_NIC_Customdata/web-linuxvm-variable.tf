#PIP 
variable "weblinuxvm_pip_allocation_method" {
  description = "Allocation method of Public ip "
  type        = string
}
variable "weblinuxvm_pip_sku" {
  description = "SKU of Web Linux VM PIP"
  type        = string
}
################################################################################

#NIC
variable "web_linux_vm_nic_private_ip_address_allocation" {
  description = "Private IP address allocation method"
  type        = string
}
################################################################################


#LinuxVm
