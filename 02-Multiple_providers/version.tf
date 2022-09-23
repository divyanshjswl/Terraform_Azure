terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.24.0"
    }
  }
}

#Provider 1 - Default
provider "azurerm" {
    features {}
}

#provider 2 - To provide additional settings
provider "azurerm" {
    features {
        virtual_machine {
          delete_os_disk_on_deletion = false
        }
    }
    alias = "donot-delete-osdisk-on-vmdeletion"
}

/*
Use Case :  use case of 2 providers
- Lets suppose we want to deploy 2 VMs is two different regions (East US and West US)
- I want that for East US VMs my os disk won't get deleted on Vm deletion
- But the OS disk should get deleted if the Vm is in West US location
- In this case in the resource.tf file we can define provider as --provider = azurerm.donot-delete-osdisk-on-vmdeletion(i.e providermname.alias)--
- And it the resource will now choose the settings of provider 2
- Check Example in resourcegroup-resource.tf file
*/