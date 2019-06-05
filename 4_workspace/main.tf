provider "azurerm" {
  version = "=1.28.0"
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
