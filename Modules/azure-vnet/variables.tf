variable "vnetname" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "address_prefixes" {
  type = list(string)
}
variable "subnet1" {
  type = string
}
variable "subnet2" {
  type = string
}
variable "subnet1_address_prefix" {
  type = list(string)
}
variable "subnet2_address_prefix" {
  type = list(string)
}