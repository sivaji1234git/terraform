variable "vmss_name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "sku" {
  type    = string
  default = "Standard_F2"
}
variable "username" {
  type = string
}
variable "password" {
  type = string
}
variable "subnet_id" {
  type = string
}
