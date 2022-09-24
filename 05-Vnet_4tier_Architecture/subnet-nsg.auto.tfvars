#web_tier_subnet
websubnet_end_name        = "TerraformWebSubnet"
web_tier_address_prefixes = ["10.1.1.0/24"]
web_tier_nsg_end_name     = "TerraformWebSubnetNsg"

#app_tier_subnet
app_tier_subnet_end_name  = "TerraformAppSubnet"
app_tier_address_prefixes = ["10.1.11.0/24"]
app_tier_nsg_end_name     = "TerraformAppSubnetNsg"

#db_tier_subnet
db_tier_subnet_end_name  = "TerraformDbSubnet"
db_tier_address_prefixes = ["10.1.21.0/24"]
db_tier_nsg_end_name         = "TerraformDbSubnetNsg"

#bastion_tier_subnet
bastion_tier_subnet_end_name  = "TerraformBastionSubnet"
bastion_tier_address_prefixes = ["10.1.31.0/24"]
bastion_tier_nsg_end_name     = "TerraformBastionSubnetNsg"