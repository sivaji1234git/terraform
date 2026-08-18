variable "projectname" {
  type = string
}
variable "region" {
  type = string
}
variable "env" {
  type = string
}
variable "vm-paswd" {
  type = string
  sensitive = true
}
variable "sqldbpass" {
  type = string
  sensitive = true
}
variable "vmsspswd" {
  type = string
  sensitive = true
}