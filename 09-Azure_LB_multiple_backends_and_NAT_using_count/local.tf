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
  web_nsg_inbound_ports = {
    "100" : "80"
    "120" : "443"
    "130" : "22"
  }
}

#App tier
locals {
  app_nsg_inbound_ports = {
    "100" : "80"
    "120" : "443"
    "130" : "8080"
    "140" : "22"
  }
}

#Db tier
locals {
  db_nsg_inbound_ports = {
    "100" : "1433"
    "120" : "3306"
    "130" : "5432"
  }
}

#Bastion tier
locals {
  bastion_nsg_inbound_ports = {
    "100" : "22"
    "120" : "3389"
    "130" : "80"
  }
}


