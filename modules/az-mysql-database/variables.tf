variable "my_rg_name_input" {
  type        = string
  description = "Resource Group ID"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "mytags_input" {
  type        = map(string)
  description = "Tags used for this project"
}
