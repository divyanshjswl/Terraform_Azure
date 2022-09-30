#web tier
variable "web_tier_address_prefixes" {
    description = "web tier address prefix"
    type = list(string)
}
#app tier 
variable "app_tier_address_prefixes" {
    description = "app tier address prefix"
    type = list(string)
}
#db tier
variable "db_tier_address_prefixes" {
    description = "db tier address prefix"
    type = list(string)
}
#bastion tier
variable "bastion_tier_address_prefixes" {
    description = "db tier address prefix"
    type = list(string)
}