#web_tier_subnet
variable "websubnet_end_name" {
  description = "Please provide the end name of the web tier subnet"
  type        = string
}
variable "web_tier_address_prefixes" {
  description = "Please provide the List of web tier subnet address prefix here"
  type        = list(string)
}
variable "web_tier_nsg_end_name" {
  description = "End name of the web tier subnet nsg"
  type        = string
}
#####################################################################################################

#app_tier_subnet
variable "app_tier_subnet_end_name" {
  description = "Please provide the end name of the app tier subnet"
  type        = string
}
variable "app_tier_address_prefixes" {
  description = "Please provide the List of App tier subnet address prefix here"
  type        = list(string)
}
variable "app_tier_nsg_end_name" {
  description = "End name of the app tier subnet nsg"
  type        = string
}
#####################################################################################################

#db_tier_subnet
variable "db_tier_subnet_end_name" {
  description = "Please provide the end name of the Db tier subnet"
  type        = string
}
variable "db_tier_address_prefixes" {
  description = "Please provide the List of Db tier subnet address prefix here"
  type        = list(string)
}
variable "db_tier_nsg_end_name" {
  description = "End name of the Db tier subnet nsg"
  type        = string
}
#####################################################################################################

#bastion_tier_subnet
variable "bastion_tier_subnet_end_name" {
  description = "Please provide the end name of the Bastion tier subnet"
  type        = string
}
variable "bastion_tier_address_prefixes" {
  description = "Please provide the List of Bastion tier subnet address prefix here"
  type        = list(string)
}
variable "bastion_tier_nsg_end_name" {
  description = "End name of the Bastion tier subnet nsg"
  type        = string
}