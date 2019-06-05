
resource "azurerm_app_service_plan" "demo" {
  name                = "demo-appserviceplan-${var.name}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "demo" {
  name                = "demo-webapp-342434333-${var.name}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  app_service_plan_id = "${azurerm_app_service_plan.demo.id}"
  https_only          = true
}