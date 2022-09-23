#Resource where we want to use provider 2 
resource "azurerm_resource_group" "resourcegroup1" {
    location = "East US"
    name = "resourcegroup-use-2nd-provider-settings-to-prevent-os-disk-deletion"
    provider = azurerm.donot-delete-osdisk-on-vmdeletion 
}


# Here this resource will use 1st provider as the first provider is default provider
resource "azurerm_resource_group" "resourcegroup2" {
    location = "West US"
    name = "resourcegroup-use-default-provider-setting"
}