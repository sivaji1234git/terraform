resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetname
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_prefixes
  subnet {
    name             = var.subnet1
    address_prefixes = var.subnet1_address_prefix
  }

  subnet {
    name             = var.subnet2
    address_prefixes = var.subnet2_address_prefix
  }

}