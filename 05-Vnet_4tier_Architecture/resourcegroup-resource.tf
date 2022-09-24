resource "azurerm_resource_group" "terraform_resource_group" {
  name     = "${local.owner}-${local.division}-${local.environment}-${var.resource_group_end_name}-${random_string.random_name.id}"
  location = var.resource_location
  tags = {
    "Name"        = "${local.owner}-${local.division}-${local.environment}-${var.resource_group_end_name}"
    "Owner"       = "${local.owner}"
    "Division"    = "${local.division}"
    "Environment" = "${local.environment}"
    "Cost_center" = "${local.cost_center}"
  }
}