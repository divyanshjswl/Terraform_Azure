#web tier
variable "web_tier_address_prefixes" {
  description = "List of Address prefix of the web tier subnet"
  type        = list(string)
}

#app tier
variable "app_tier_address_prefixes" {
  description = "List of Address prefix of the wapp tier subnet"
  type        = list(string)
}

#Db tier
variable "db_tier_address_prefixes" {
  description = "List of Address prefix of the db tier subnet"
  type        = list(string)
}

#Bastion tier
variable "bastion_tier_address_prefixes" {
  description = "List of Address prefix of the bastion tier subnet"
  type        = list(string)
}