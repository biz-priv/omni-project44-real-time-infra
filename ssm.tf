resource "aws_ssm_parameter" "ltl_location_update_queue_arn" {
  name  = "/${var.application}/${var.env}/ltl-location-update-queue-arn"
  type  = "String"
  value = aws_sqs_queue.omni_project44_real_time_infra_ltl_location_update_queue.arn

  tags = {
    Name  = "/${var.application}/${var.env}/ltl-location-update-queue-arn"
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_ltl_location_update_log_table_name" {
  name  = "/${var.application}/${var.env}/ltl-location-update-log-table-name"
  type  = "String"
  value = aws_dynamodb_table.omni_ltl_location_update_log_table.name
  tags = {
    Name  = "/${var.application}/${var.env}/ltl-location-update-log-table-name"
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_ltl_location_update_log_table_status_index" {
  name  = "/${var.application}/${var.env}/ltl-location-update-log-table-status-index"
  type  = "String"
  value = "Status-index"
  tags = {
    Name  = "/${var.application}/${var.env}/ltl-location-update-log-table-status-index"
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_ltl_location_update_api_url" {
  name  = "/${var.application}/${var.env}/ltl-location-update/api.url"
  type  = "String"
  value = var.omni_ltl_location_update_api_url
  tags = {
    Name  = "/${var.application}/${var.env}/ltl-location-update/api.url"
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni-dw-p44-young-living-customer-numbers" {
  name  = "/omni-p44-rt-updates/${var.env}/young-living-customer/numbers"
  type  = "StringList"
  value = var.omni_young_living_customer_number

  tags = {
    Application = "omni-project44-real-time-updates"
    CreatedBy   = "BizCloudExperts"
    Environment = var.env
    STAGE       = var.env
    Name        = "/omni-p44-rt-updates/${var.env}/young-living-customer/numbers"
  }
}

resource "aws_ssm_parameter" "omni-dw-p44-young-living-customer-id" {
  name  = "/omni-p44-rt-updates/${var.env}/young-living-customer/id"
  type  = "String"
  value = var.omni_young_living_customer_id

  tags = {
    Application = "omni-project44-real-time-updates"
    CreatedBy   = "BizCloudExperts"
    Environment = var.env
    STAGE       = var.env
    Name        = "/omni-p44-rt-updates/${var.env}/young-living-customer/id"
  }
}

resource "aws_ssm_parameter" "omni-p44-young-living-location-update-arn" {
  name  = "/omni/${var.env}/p44-young-living/location-updates/sqs.arn"
  type  = "String"
  value = aws_sqs_queue.omni_p44_young_living_location_update_sqs.arn

  tags = {
    Name  = "/omni/${var.env}/p44-young-living/location-updates/sqs.arn"
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}