locals {
  owner       = var.owner
  division    = var.division
  environment = var.environment
  cost_center = var.cost_center
  common_tags = {
    Name = "${local.owner}-${local.division}-${local.environment}"
  }
}

#App Tier NSG ports map
locals {
  app_tier_nsg_ports = {
    "100" : "22"
    "110" : "443"
    "120" : "80"
    "130" : "8080"
  }
}

#Web Tier ports map
locals {
  web_tier_nsg_ports = {
    "100" : "22"
    "110" : "443"
    "120" : "80"
  }
}

#Db Tier ports map
locals {
  db_tier_nsg_ports = {
    "100" : "3306"
    "110" : "5432"
    "120" : "1433"
  }
}

#Bastion Tier ports map
locals {
  bastion_tier_nsg_ports = {
    "100" : "22"
    "110" : "3389"
  }
}

#web_linuxvm_nic_nsg_ports
locals {
  web_linuxvm_nic_nsg_ports = {
    "100" : "22"
    "110" : "80"
    "120" : "443"
  }
}
#################################################################################
#WebLinuxVm Custom Data 
locals {
  web_linux_custom_data = <<CUSTOM_DATA
#!/bin/sh
#sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd  
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo chmod -R 777 /var/www/html 
sudo echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/app1/hostname.html
sudo echo "Welcome to stacksimplify - WebVM App1 - App Status Page" > /var/www/html/app1/status.html
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Simplify - WebVM APP-1 </h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
sudo curl -H "Metadata:true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01" -o /var/www/html/app1/metadata.html
CUSTOM_DATA
}

