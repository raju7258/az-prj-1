variable "resource_location" {
  type        = string
  default     = "East US"
  description = "Resource Location for this project"
}

variable "mytags" {
  type = map(string)
  default = {
    contact = "rajesh.nair@nordcloud.com"
  }
}