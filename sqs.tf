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
