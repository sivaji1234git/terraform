terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "iac-rg"
    storage_account_name = "iacinfrastate"
    container_name       = "dev-con"
    key                  = "dev-terraform.tfstate"
  }
}
locals {
  nsgname             = "${var.projectname}-${var.region}-${var.env}-nsg"
  vnetname            = "${var.projectname}-${var.region}-${var.env}-vnet"
  subnetname          = "${var.projectname}-${var.region}-${var.env}-vmsubnet"
  nicname             = "${var.projectname}-${var.region}-${var.env}-vmnic"
  aspname             = "${var.projectname}-${var.region}-${var.env}-aspplan"
  webappname          = "${var.projectname}-${var.region}-${var.env}-webapp"
  lbfipname           = "${var.projectname}-${var.region}-${var.env}-lbfip"
  lbname              = "${var.projectname}-${var.region}-${var.env}-lb"
  apw-name            = "${var.projectname}-${var.region}-${var.env}-apw"
  apw-fip             = "${var.projectname}-${var.region}-${var.env}-apw-fip"
  acr-name            = "${var.projectname}${var.region}${var.env}acr"
  sqlservername       = "${var.projectname}-${var.region}-${var.env}-sqlserver"
  sqldbname           = "${var.projectname}-${var.region}-${var.env}-sqldb"
  pvt-ep-name         = "${var.projectname}-${var.region}-${var.env}-pvt-ep"
  pvtepsubnet         = "${var.projectname}-${var.region}-${var.env}-pvtepsubnet"
  k8s-cluster         = "${var.projectname}-${var.region}-${var.env}-k8s-cluster"
  wafname             = "${var.projectname}-${var.region}-${var.env}-waf"
  routetablename      = "${var.projectname}-${var.region}-${var.env}-rt"
  firewall_frontendip = "${var.projectname}-${var.region}-${var.env}-fip"
  firewall_name       = "${var.projectname}-${var.region}-${var.env}-firewall"
  vmname              = "${var.projectname}-${var.region}-${var.env}-vm"
  vmssname            = "${var.projectname}-${var.region}-${var.env}-vmss"
  diskname            = "${var.projectname}-${var.region}-${var.env}-disk"
  keyvault_name       = "${var.projectname}-${var.region}-${var.env}-kv"
}
data "azurerm_resource_group" "rg" {
  name = "iac-rg"
}
data "azurerm_key_vault" "kv" {
  name                = local.keyvault_name
  resource_group_name = data.azurerm_resource_group.rg.name
}
/*module "disk" {
  source              = "./Modules/azure-emptydisk"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  disk_name           = local.diskname
  disk_size_gb        = 1

}*/

/*module "vnet" {
  source                 = "./Modules/azure-vnet"
  vnetname               = local.vnetname
  resource_group_name    = data.azurerm_resource_group.rg.name
  location               = "westus"
  address_prefixes       = ["10.0.0.0/22"]
  subnet1                = local.pvtepsubnet
  subnet1_address_prefix = ["10.0.0.0/28"]
  subnet2                = local.subnetname
  subnet2_address_prefix = ["10.0.0.16/28"]
}*/
/*module "azure-stg-acc" {
  source = "./Modules/azure-stg-acc"
  stgname = "stgdev38y3asjdh"
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  account_tier = "Standard"
  account_replication_type = "LRS"
}*/
/*module "nsg" {
  source              = "./Modules/azure-nsg"
  nsgname             = local.nsgname
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  rulename            = "allow-tcp"
}*/
/*module "windows_vm" {
  source = "./Modules/azure-winvm"
  vnetname = local.vnetname
  resource_group_name = data.azurerm_resource_group.rg.name
  location = "Eastus"
  address_prefixes = ["10.10.0.0/24"]
  subnetname = local.subnetname
  subnet_address_prefix = ["10.10.0.0/28"]
  nicname = local.nicname
  vmname = "iac-vm"
  vmadminuser = "sivaji"
  vmpaswd = "Cloudadmin@987"
  vmsize = "Standard_D2s_v3"
  Windows_os_sku = "2019-Datacenter"

}*/
/*module "winwebapp" {
  source = "./Modules/azure-winwebapp"
  aspname = local.aspname
  webappname = local.webappname
  resource_group_name = data.azurerm_resource_group.rg.name
  location = "Westus"
  aspplan_sku = "S1"
}*/
/*module "azure-lb" {
  source              = "./Modules/azure-lb"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = "westus"
  lbfipname           = local.lbfipname
  lbname              = local.lbname
  BackEndAddressPool  = "mybp"
}
*/
/*module "apw-gateway" {
  source = "./Modules/azure-app-gateway"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = "westus"
  appgateway-name = local.apw-name
  apw-pip = local.apw-fip
  apw-subnet_id = data.azurerm_subnet.nameapw-subnet.id
  vnet-name = data.azurerm_virtual_network.vnet.name
}*/
/*module "container-registry" {
  source = "./Modules/azure-container-registry"
  acr-name = local.acr-name
  resource_group_name = data.azurerm_resource_group.rg.name
  location = "westus"
  acr-sku = "Premium"
  
}*/
/*module "sqlserver" {
  source              = "./Modules/azure-sql-db"
  sqlservername       = local.sqlservername
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = "westus"
  sqlserveradmin      = "sivaji"
  sqlpswd             = "Clouadmin@987"
  sqldbname           = local.sqldbname
  dbsize              = 5
  dbsku               = "S1"
}*/
/*module "pvtep" {
  source                     = "./Modules/azure-pvt-endpoint"
  resource_group_name        = data.azurerm_resource_group.rg.name
  location                   = "westus"
  vnet-id                    = data.azurerm_virtual_network.vnet.id
  subnet_id                  = data.azurerm_subnet.pvtep-subnet.id
  pvtep-name                 = local.pvt-ep-name
  private_service_connection = "myepsconn"
  pvtep_resource_id          = data.azurerm_storage_account.stgacc.id
  pvt_dns_name               = "mystgaccep"
  dnszonename                = "mydnszone"
  dnslinkname                = "mydnslink213"
}*/
/*module "k8s-cluster" {
  source              = "./Modules/azure-aks-cluster"
  cluster-name        = local.k8s-cluster
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = "westus"
  dns_prefix          = "k8sdns"

}*/

/*module "waf" {
  source              = "./Modules/azure-waf"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = "westus"
  wafname             = local.wafname
}*/
/*module "routetable" {
  source                 = "./Modules/azure-route-table"
  resource_group_name    = data.azurerm_resource_group.rg.name
  location               = "westus"
  routetable             = local.routetablename
  routename              = "allowfirewall"
  subnet_id              = data.azurerm_subnet.subnet1.id
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = "10.0.0.10"
  address_prefix         = "10.0.0.0/28"
}*/
/*module "azure_firewall" {
  source                           = "./Modules/azure-firewall"
  resource_group_name              = data.azurerm_resource_group.rg.name
  location                         = "westus"
  vnetname                         = local.vnetname
  address_space                    = ["10.0.0.0/22"]
  AzureFirewallSubnet_addressspace = ["10.0.0.0/24"]
  fpip                             = local.firewall_frontendip
  firewall_name                    = local.firewall_name
}*/
/*module "azurevm" {
  source              = "./Modules/azure-linuxvm"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  subnetname          = local.subnetname
  subnet_addressspace = ["10.0.1.0/28"]
  vnetname            = data.azurerm_virtual_network.vnet.name
  nicname             = local.nicname
  vmname              = local.vmname
  admin_username      = "sivaji"
}*/
/*module "winvmss" {
  source              = "./Modules/azure-winvmss"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  vmss_name           = local.vmssname
  subnet_id           = data.azurerm_subnet.vmsubnet.id
  username            = "sivaji"
  password            = "Cloudadmin@123"
}*/
module "keyvault" {
  source              = "./Modules/azure-keyvault"
  key_vault_name      = local.keyvault_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}
module "kv_secret" {
  source         = "./Modules/azure-kv-secret"
  key_vault_id   = data.azurerm_key_vault.kv.id
  kv_secret_name = "mysceret"
  secret_value   = "cloudadmin@123"
}
