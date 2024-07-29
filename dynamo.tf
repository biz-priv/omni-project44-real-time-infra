resource "aws_dynamodb_table" "omni_ltl_location_update_status_table" {
  name             = "omni-ltl-location-update-status-${var.env}"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "Housebill"
  range_key        = "TimeStamp"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "Housebill"
    type = "S"
  }

  attribute {
    name = "TimeStamp"
    type = "S"
  }

  attribute {
    name = "Status"
    type = "S"
  }

  ttl {
    attribute_name = "expiration"
    enabled        = true
  }

  global_secondary_index {
    name            = "Status-index"
    hash_key        = "Status"
    projection_type = "ALL"
  }

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}
