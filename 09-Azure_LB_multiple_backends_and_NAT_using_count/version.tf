terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.24.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

provider "azurerm" {
  features {}
}