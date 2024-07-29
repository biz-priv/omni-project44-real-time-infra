variable "env" {
  type     = string
  nullable = false
}

variable "region" {
  type     = string
  nullable = false
}

variable "aws_account_number" {
  type     = string
  nullable = false
}

variable "created_by" {
  type     = string
  nullable = false
}

variable "application" {
  type     = string
  nullable = false
}

variable "omni_ltl_location_update_api_url" {
  type = string
  nullable = false
}