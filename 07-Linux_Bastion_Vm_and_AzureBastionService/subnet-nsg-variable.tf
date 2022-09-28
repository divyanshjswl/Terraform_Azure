#web tier
variable "web_tier_address_prefixes" {
  description = "List of the web tier subnet address space"
  type        = list(string)
}

#app tier
variable "app_tier_address_prefixes" {
  description = "List of the app tier subnet address space"
  type        = list(string)
}

#Db tier
variable "db_tier_address_prefixes" {
  description = "List of the Db tier subnet address space"
  type        = list(string)
}

#bastion tier
variable "bastion_tier_address_prefixes" {
  description = "List of the Db tier subnet address space"
  type        = list(string)
}