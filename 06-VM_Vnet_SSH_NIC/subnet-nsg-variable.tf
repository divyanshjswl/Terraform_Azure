#App Tier variables
variable "app_tier_address_prefixes" {
  description = "List of App tier subnet CIDR range"
  type        = list(string)
}

#Web Tier variables
variable "web_tier_address_prefixes" {
  description = "List of Web tier subnet CIDR range"
  type        = list(string)

}

#Dv Tier variables 
variable "db_tier_address_prefixes" {
  description = "List of db tier subnet CIDR range"
  type        = list(string)
}

#Bastion Tier variables
variable "bastion_tier_address_prefixes" {
  description = "List of bastion tier subnet CIDR range"
  type        = list(string)
}