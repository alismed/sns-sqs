resource "aws_sqs_queue" "terraform_queue" {
  name                       = var.name
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size_bytes
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  #policy                     = var.policy
  #redrive_policy             = var.redrive_policy

  sqs_managed_sse_enabled = true

  tags = var.tags
}