#Resource group
resource "azurerm_resource_group" "terraform_rg" {
  location = "East US"
  name     = "Terraform-RG"
}


#Storage Account
resource "azurerm_storage_account" "terraform_sa" {
  name                     = "terrasa${random_string.random_suffix_for_sa.id}"
  resource_group_name      = azurerm_resource_group.terraform_rg.name
  location                 = azurerm_resource_group.terraform_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    Name = "terrasa${random_string.random_suffix_for_sa.id}"
  }
}