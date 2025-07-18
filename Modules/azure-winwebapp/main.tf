
resource "azurerm_service_plan" "aspplan" {
  name                = var.aspname
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.aspplan_sku
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "winwebapp" {
  name                = var.webappname
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.aspplan.id

  site_config {}
}