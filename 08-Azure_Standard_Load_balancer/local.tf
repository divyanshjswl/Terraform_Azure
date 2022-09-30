locals {
  owner = var.owner
  division = var.division
  environment = var.environment
  cost_center = var.cost_center
  common_tags = {
    Name = "${local.owner}-${local.division}-${local.environment}"
  }
}

#web tier ports
locals {
  web_tier_nsg_ports = {
    "100" : "80"
    "120" : "443"
    "130" : "22"
  }
}
#app tier
locals {
  app_tier_nsg_ports = {
    "100" : "80"
    "120" : "443"
    "130" : "22"
    "140" : "8080"
  }
}

#db tier 
locals {
  db_tier_nsg_ports = {
    "100" : "1433"
    "120" : "3306"
    "130" : "5432"
  }
}

#bastion tier
locals {
  bastion_tier_nsg_ports = {
    "100" : "22"
    "120" : "3389"
  }
}
