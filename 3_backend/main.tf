provider "azurerm" {
  version = "=1.28.0"
}

terraform {
  backend "azurerm" {
    storage_account_name = "terraformdemobackend"
    container_name       = "terraform-container"
    key                  = "terraform.tfstate"
  }
}

data "azurerm_resource_group" "demo" {
  name = "DemoRG"
}

resource "azurerm_app_service_plan" "demo" {
  name                = "demo-appserviceplan"
  resource_group_name = "${data.azurerm_resource_group.demo.name}"
  location            = "${data.azurerm_resource_group.demo.location}"

  sku {
    tier = "Basic"
    size = "B1"
  }
}
