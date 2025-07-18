resource "azurerm_route_table" "routetable" {
  name                = var.routetable
  location            = var.location
  resource_group_name = var.resource_group_name

  route {
    name                   = var.routename
    address_prefix         = var.address_prefix
    next_hop_type          = var.next_hop_type
    next_hop_in_ip_address = var.next_hop_in_ip_address
  }
}

resource "azurerm_subnet_route_table_association" "routeassociate" {
  subnet_id      = var.subnet_id
  route_table_id = azurerm_route_table.routetable.id
}
