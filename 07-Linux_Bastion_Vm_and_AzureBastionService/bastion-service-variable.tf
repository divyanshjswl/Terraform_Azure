variable "azure_bastion_service_address_prefixes" {
  description = "List of address prefixes or CIDR range for Bastion service subnet"
  type        = list(string)
}