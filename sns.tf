resource "aws_sns_topic_subscription" "shipment_milestone_stream_sns_subscription" {
  topic_arn = "arn:aws:sns:us-east-1:${var.aws_account_number}:omni-dw-shipment-location-updates-${var.env}"
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.omni_project44_real_time_infra_ltl_location_update_queue.arn
  filter_policy = jsonencode({
    "BillNo" : ["22209","22210","21719"]
  })
}
