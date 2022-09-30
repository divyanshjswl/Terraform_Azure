#web tier
variable "web_tier_subnet_address_prefixes" {
  description = "web tier subnet address space"
  type        = list(string)
}

#app tier
variable "app_tier_subnet_address_prefixes" {
  description = "app tier subnet address space"
  type        = list(string)
}

#db tier
variable "db_tier_subnet_address_prefixes" {
  description = "db tier subnet address space"
  type        = list(string)
}

#bastion tier
variable "bastion_tier_subnet_address_prefixes" {
  description = "bastion tier subnet address space"
  type        = list(string)
}