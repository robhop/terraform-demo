provider "azurerm" {
  version = "=1.28.0"
}

data "azurerm_resource_group" "demo" {
  name = "DemoRG"
}

module "demo-foo" {
  source              = "demo"
  name                = "${terraform.workspace}foo"
  resource_group_name = "${data.azurerm_resource_group.demo.name}"
  location            = "${data.azurerm_resource_group.demo.location}"
}
module "demo-bar" {
  source              = "demo"
  name                = "${terraform.workspace}bar"
  resource_group_name = "${data.azurerm_resource_group.demo.name}"
  location            = "${data.azurerm_resource_group.demo.location}"
}
