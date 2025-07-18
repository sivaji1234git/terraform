
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetname
  address_space       = var.address_prefixes
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnte1" {
  name                 = var.subnetname
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnetname
  address_prefixes     = var.subnet_address_prefix
  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_network_interface" "vmnic" {
  name                = var.nicname
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnte1.id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [ azurerm_virtual_network.vnet ]
}

resource "azurerm_windows_virtual_machine" "winvm" {
  name                = var.vmname
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vmsize
  admin_username      = var.vmadminuser
  admin_password      = var.vmpaswd
  network_interface_ids = [
    azurerm_network_interface.vmnic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.Windows_os_sku
    version   = "latest"
  }
  depends_on = [ azurerm_virtual_network.vnet,azurerm_network_interface.vmnic]
}