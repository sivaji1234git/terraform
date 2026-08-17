variable "sqlservername" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "sqlserveradmin" {
  type = string
}
variable "sqlpswd" {
  type = string
  sensitive = true
}
variable "sqldbname" {
  type = string
}
variable "dbsize" {
  type = number
}
variable "dbsku" {
  type = string
}
