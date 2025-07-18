resource "azurerm_private_endpoint" "pvt-ep" {
  name                = var.pvtep-name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.private_service_connection
    private_connection_resource_id = var.pvtep_resource_id
    subresource_names              = try([var.subresource_name], null)
    is_manual_connection           = false
  }

}
