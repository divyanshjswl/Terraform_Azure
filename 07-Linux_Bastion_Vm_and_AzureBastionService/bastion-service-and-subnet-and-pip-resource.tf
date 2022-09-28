#Azure Bastion Service Subnet
resource "azurerm_subnet" "azure_bastion_service_subnet" {
  name                 = "AzureBastionService"
  resource_group_name  = azurerm_resource_group.terraform_rg.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = var.azure_bastion_service_address_prefixes
}

#Azure Bastion Service Public IP
resource "azurerm_public_ip" "azure_bastion_service_puplic_ip" {
  name                = "${local.owner}-${local.division}-${local.environment}-AzureBastionServicePip"
  resource_group_name = azurerm_resource_group.terraform_rg.name
  location            = azurerm_resource_group.terraform_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-AzureBastionServicePip"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Cost_center" = "${local.cost_center}"
  }
}

#Azure Bastion Service Resource
resource "azurerm_bastion_host" "azure_bastion_service" {
  name                = "${local.owner}-${local.division}-${local.environment}-AzureBastionServiceTerraform"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name

  ip_configuration {
    name                 = "${local.owner}-${local.division}-${local.environment}-AzureBastionServiceIPConfiguration"
    subnet_id            = azurerm_subnet.azure_bastion_service_subnet.id
    public_ip_address_id = azurerm_public_ip.azure_bastion_service_puplic_ip.id
  }
}