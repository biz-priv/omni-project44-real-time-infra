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

variable "omni_young_living_customer_number" {
  type    = string
  nullable = false
}

variable "omni_young_living_customer_id" {
  type   = string
  nullable = false
}

variable "omni_p44_young_living_location_update_notification_email_list" {
  type   = string
  nullable = false
}