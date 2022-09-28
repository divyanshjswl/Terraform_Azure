resource "azurerm_resource_group" "terraform_rg" {
  name     = "${local.owner}-${local.division}-${local.environment}-TerraformRg-${random_string.randomname.id}"
  location = var.location
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-TerraformRg-${random_string.randomname.id}"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Cost_center" = "${local.cost_center}"
  }
}