#For common local values used in tags
locals {
  owner       = var.owner
  division    = var.division
  environment = var.environment
  cost_center = var.cost_center
  common_tags = {
    Name = "${local.owner}-${local.division}-${local.environment}"
  }
}

#For web tier NSG rules ports local used with for_each
locals {
  web_tier_inbound_rule_map = {
    "100" = "22",
    "110" = "443",
    "120" = "80"
  }
}
##########################################################################################

#For app tier NSG rules ports local used with for_each
locals {
  app_tier_inbound_rule_map = {
    "100" = "22",
    "110" = "443",
    "120" = "80",
    "130" = "8080"
  }
}
##########################################################################################

#For db tier NSG rules ports local used with for_each
locals {
  db_tier_inbound_rule_map = {
    "100" = "3306",
    "110" = "1433",
    "120" = "5432"
  }
}
##########################################################################################

#For bastion tier NSG rules ports local used with for_each
locals {
  bastion_tier_inbound_rule_map = {
    "100" = "22",
    "110" = "3389"
  }
}