resource "aws_sqs_queue" "omni_project44_real_time_infra_ltl_location_update_queue" {
  name                       = "${var.application}-ltl-location-update-queue-${var.env}"
  visibility_timeout_seconds = 300
  tags = {
    Name        = "${var.application}-ltl-location-update-queue-${var.env}"
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
    STAGE       = var.env
  }
}

data "aws_iam_policy_document" "omni_project44_real_time_infra_ltl_location_update_queue_policy" {
  policy_id = "${aws_sqs_queue.omni_project44_real_time_infra_ltl_location_update_queue.arn}/SQSDefaultPolicy"
  statement {
    sid    = "Allow SNS publish to SQS"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "SQS:SendMessage",
    ]
    resources = [
      aws_sqs_queue.omni_project44_real_time_infra_ltl_location_update_queue.arn
    ]
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-dw-shipment-location-updates-${var.env}"
      ]
    }
  }
}

resource "aws_sqs_queue_policy" "omni_project44_real_time_infra_ltl_location_update_queue_policy" {
  queue_url = aws_sqs_queue.omni_project44_real_time_infra_ltl_location_update_queue.id
  policy    = data.aws_iam_policy_document.omni_project44_real_time_infra_ltl_location_update_queue_policy.json
}

resource "aws_sqs_queue" "omni_p44_young_living_location_update_sqs" {
  name                       = "omni-p44-young-living-location-update-${var.env}"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600
  visibility_timeout_seconds = 900
  receive_wait_time_seconds  = 0

  tags = {
    Name = "omni-p44-young-living-location-update-${var.env}"
    Application = var.application
    CreatedBy   = var.created_by
    Environment = var.env
  }
}

data "aws_iam_policy_document" "omni_p44_young_living_location_updates_queue_policy" {
  policy_id = "${aws_sqs_queue.omni_p44_young_living_location_update_sqs.arn}/SQSDefaultPolicy"
  statement {
    sid    = "Allow SNS publish to SQS"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "SQS:SendMessage",
    ]
    resources = [
      aws_sqs_queue.omni_p44_young_living_location_update_sqs.arn
    ]
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-dw-shipment-location-updates-${var.env}"
      ]
    }
  }
}

resource "aws_sns_topic_subscription" "omni_p44_young_living_shipment_location_updates_sns_subscription" {
  topic_arn = "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-dw-shipment-location-updates-${var.env}"
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.omni_p44_young_living_location_update_sqs.arn

  filter_policy = jsonencode(
    {
      BillNo = [
        "10940"
      ]
    }
  )
}