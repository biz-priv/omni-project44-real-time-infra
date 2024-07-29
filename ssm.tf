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
    Name  = "/${var.application}/${var.env}/ltl-location-update-log-table-status-index"
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}
