resource "azurerm_private_dns_zone" "pvtdnsname" {
  name                = "${var.dnsname}.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dnslink" {
  name                  = "test"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.pvtdnsname.name
  virtual_network_id    = var.virtual_network_id
}
