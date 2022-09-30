locals {
  owner       = var.owner
  division    = var.division
  environment = var.environment
  cost_center = var.cost_center
  common_tags = {
    Name = "${local.owner}-${local.division}-${local.environment}"
  }
}


#web tier 
locals {
  web_tier_inbound_ports = {
    "100" : "80"
    "110" : "443"
    "120" : "22"
  }
}

#app tier
locals {
  app_tier_inbound_ports = {
    "100" : "80"
    "110" : "443"
    "120" : "8080"
    "130" : "22"
  }
}


#db tier
locals {
  db_tier_inbound_ports = {
    "100" : "1433"
    "110" : "3306"
    "120" : "5432"
  }
}

#bastion tier
locals {
  bastion_tier_inbound_ports = {
    "100" : "80"
    "110" : "3389"
    "120" : "22"
  }
}
