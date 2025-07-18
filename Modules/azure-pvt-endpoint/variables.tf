variable "pvtep-name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "vnet-id" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "private_service_connection" {
  type = string
}
variable "pvtep_resource_id" {
  type = string
}

variable "pvt_dns_name" {
  type = string
}
variable "dnszonename" {
  type = string
}
variable "dnslinkname" {
  type = string
}
variable "subresource_name" {
  type = list(string)
}
