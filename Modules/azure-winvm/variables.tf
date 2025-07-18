variable "vnetname" {
    type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "address_prefixes" {
  type = list(string)
}
variable "subnetname" {
  type = string
}
variable "subnet_address_prefix" {
  type = list(string)
}
variable "nicname" {
  type = string
}
variable "vmname" {
  type = string
}
variable "vmsize" {
  type = string
}
variable "vmadminuser" {
  type = string
}
variable "vmpaswd" {
  type = string
}
variable "Windows_os_sku" {
  type = string
}