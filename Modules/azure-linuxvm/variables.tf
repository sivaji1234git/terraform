variable "subnetname" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "subnet_addressspace" {
  type = list(string)
}
variable "vnetname" {
  type = string
}
variable "nicname" {
  type = string
}
variable "vmname" {
  type = string
}
variable "admin_username" {
  type = string
}
