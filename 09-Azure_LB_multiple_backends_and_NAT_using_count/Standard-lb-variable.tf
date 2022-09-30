variable "lb_sku" {
  description = "Standard keeping unit of the Load balancer"
  type        = string
}

variable "lb_frontend_ports_for_rdp" {
  description = "value"
  type        = list(string)
}