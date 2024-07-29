resource "aws_ssm_parameter" "ltl_location_update_queue_arn" {
  name  = "/${var.application}/${var.env}/ltl-location-update-queue-arn"
  type  = "String"
  value = aws_sqs_queue.omni_project44_real_time_infra_ltl_location_update_queue.arn

  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_ltl_location_update_status_table_name" {
  name  = "/${var.application}/${var.env}/ltl-location-update-status-table-name"
  type  = "String"
  value = aws_dynamodb_table.omni_ltl_location_update_status_table.name
  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_ltl_location_update_status_table_table_stream_arn" {
  name  = "/${var.application}/${var.env}/ltl-location-update-status-table-stream-arn"
  type  = "String"
  value = aws_dynamodb_table.omni_ltl_location_update_status_table.stream_arn
  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

resource "aws_ssm_parameter" "omni_ltl_location_update_status_table_table_status_index" {
  name  = "/${var.application}/${var.env}/ltl-location-update-status-table-status-index"
  type  = "String"
  value = "Status-index"
  tags = {
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}
