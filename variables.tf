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

variable "mysql_username" {
  type        = string
  default     = "mysqladmin"
  description = "MySQL Username"
}

variable "mysql_password" {
  type        = string
  default     = "H@Sh1CoR3!"
  description = "MySQL Password"
  sensitive = true
}