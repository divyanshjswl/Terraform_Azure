locals {
  owner       = var.owner
  division    = var.division
  environment = var.environment
  cost_center = var.cost_center
  common_tags = {
    Name = "${local.owner}-${local.division}-${local.environment}"
  }
}

#Web tier inbound ports map with for_each
locals {
  web_subnet_inbound_ports = {
    "100" : "80"
    "110" : "443"
    "120" : "22"
  }
}

#App tier inbound ports map with for_each
locals {
  app_subnet_inbound_ports = {
    "100" : "80"
    "110" : "443"
    "120" : "22"
    "130" : "8080"
  }
}

#App tier inbound ports map with for_each
locals {
  db_subnet_inbound_ports = {
    "100" : "3306"
    "110" : "5432"
    "120" : "1433"
  }
}

#Bastion tier inbound ports map with for_each
locals {
  bastion_subnet_inbound_ports = {
    "100" : "22"
    "110" : "3389"
  }
}

#WebLinuxVm Custom Data
locals {
  web_linux_vm_custom_data = <<CUSTOM_DATA
#!/bin/sh
#sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd  
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo chmod -R 777 /var/www/html 
sudo echo "Welcome to Divyansh World - WebLinuxVM App1 - VM Hostname: $(hostname)" > /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo "Welcome to Divyansh World - WebVM App1 - VM Hostname: $(hostname)" > /var/www/html/app1/hostname.html
sudo echo "Welcome to Divyansh World - WebVM App1 - App Status Page" > /var/www/html/app1/status.html
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Divyansh World - WebLinuxVM APP-1 </h1> <p>Terraform Code written by Divyansh</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
sudo curl -H "Metadata:true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01" -o /var/www/html/app1/metadata.html
CUSTOM_DATA
}
