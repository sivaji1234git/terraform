variable "disk_name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "storage_account_type" {
  type    = string
  default = "Standard_LRS"
}
variable "disk_size_gb" {
  type = number
}
