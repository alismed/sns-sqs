
resource "aws_sqs_queue" "terraform_queue" {
  name                       = var.queue_name
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size_bytes
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  policy                     = file("${path.module}/trust/sqs-policy.json")
  
  sqs_managed_sse_enabled    = true

  #redrive_policy             = file("${path.module}/trust/sqs-redrive_policy.json")
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_dlq.arn
    maxReceiveCount     = var.deadletter_max_receive_count
  })

  tags = var.tags
}

resource "aws_sqs_queue" "terraform_dlq" {
  name                       = var.deadletter_name
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size_bytes
  receive_wait_time_seconds  = var.deadletter_receive_wait_time
  sqs_managed_sse_enabled    = true
  policy                     = file("${path.module}/trust/dlq-policy.json")

  tags = var.tags
}
