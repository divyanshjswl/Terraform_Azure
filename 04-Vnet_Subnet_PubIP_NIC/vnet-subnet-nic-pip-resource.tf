#Virtual Network
resource "azurerm_virtual_network" "terraform_vnet" {
  name                = "Terraform-Vnet"
  location            = "East US"
  resource_group_name = azurerm_resource_group.terraform_rg.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    "Name" = "Terraform-Vnet"
  }
}

#Subnet
resource "azurerm_subnet" "terraform_subnet" {
  name                 = "Terraform-subnet"
  resource_group_name  = azurerm_resource_group.terraform_rg.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}


#Public IP
resource "azurerm_public_ip" "terraform_pip" {
  name                = "Terraform-Pip"
  resource_group_name = azurerm_resource_group.terraform_rg.name
  location            = azurerm_resource_group.terraform_rg.location
  allocation_method   = "Static"
  tags = {
    "Name" = "Terraform-Pip"
  }
}


#NIC card
resource "azurerm_network_interface" "terraform_nic" {
  name                = "Terraform-Nic"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraform_pip.id
  }
}
