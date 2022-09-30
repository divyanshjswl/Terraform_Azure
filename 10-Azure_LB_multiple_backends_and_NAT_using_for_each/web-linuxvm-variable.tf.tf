variable "web_linux_ports" {
  description = "Web Linux NAT ports and Linux names"
  type        = map(string)
}

variable "web_linuxvm_size" {
  description = "size of the web linux vms"
  type        = string
}