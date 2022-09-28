resource "azurerm_virtual_network" "terraform_vnet" {
  name                = "${local.owner}-${local.division}-${local.environment}-TerraformVnet"
  location            = azurerm_resource_group.terraform_rg.location
  resource_group_name = azurerm_resource_group.terraform_rg.name
  address_space       = var.vnet_address_space
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformVnet"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Cost_center" = "${local.cost_center}"
  }
}