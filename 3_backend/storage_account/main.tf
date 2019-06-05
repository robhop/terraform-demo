provider "azurerm" {
  version = "=1.28.0"
}

data "azurerm_resource_group" "demo" {
  name = "DemoRG"
}

resource "azurerm_storage_account" "demo" {
  name                     = "terraformdemobackend"
  resource_group_name      = "${data.azurerm_resource_group.demo.name}"
  location                 = "${data.azurerm_resource_group.demo.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "demo" {
  name                  = "terraform-container"
  storage_account_name = "${azurerm_storage_account.demo.name}"
  resource_group_name      = "${data.azurerm_resource_group.demo.name}"
  container_access_type = "private"
}


output "access_key" {
  value = "${azurerm_storage_account.demo.primary_access_key}"
}
