#we created resource so we define resource block
#to create varaibles the block name will be varaibles
variable "business_devision" {
  description = "business devision on large organization"
  type        = string #list of string #map
  default     = "sap"
}

variable "environment" {
  description = "environment varaibles used as prefix"
  type        = string
  default     = "dev"
}
#i need a meaningfull name
#sap-dev-rg-default
variable "resource_group_name" {
  type    = string
  default = "rg-default"
}

variable "resource_group_location" {
  type    = string
  default = "eastus2"
}