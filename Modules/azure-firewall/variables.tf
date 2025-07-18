variable "vnetname" {
  type = string
}
variable "location" {
  type = string
}
variable "address_space" {
  type = list(string)
}
variable "resource_group_name" {
  type = string
}
variable "AzureFirewallSubnet_addressspace" {
  type = list(string)
}
variable "fpip" {
  type = string
}
variable "firewall_name" {
  type = string
}
