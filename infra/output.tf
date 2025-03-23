output "sqs_queue_url" {
  description = "The URL of the created SQS queue"
  value       = aws_sqs_queue.terraform_queue.url
}

output "sqs_queue_arn" {
  description = "The ARN of the created SQS queue"
  value       = aws_sqs_queue.terraform_queue.arn
}

output "sqs_queue_name" {
  description = "The name of the created SQS queue"
  value       = aws_sqs_queue.terraform_queue.name
}

output "sqs_queue_id" {
  description = "The ID of the created SQS queue"
  value       = aws_sqs_queue.terraform_queue.id
}

output "sqs_dlq_url" {
  description = "The URL of the created SQS dead-letter queue"
  value       = aws_sqs_queue.terraform_dlq.url
}

output "sqs_dlq_arn" {
  description = "The ARN of the created SQS dead-letter queue"
  value       = aws_sqs_queue.terraform_dlq.arn
}

output "sqs_dlq_name" {
  description = "The name of the created SQS dead-letter queue"
  value       = aws_sqs_queue.terraform_dlq.name
}

output "sqs_dlq_id" {
  description = "The ID of the created SQS dead-letter queue"
  value       = aws_sqs_queue.terraform_dlq.id
}

output "sns_topic_arn" {
  description = "The ARN of the created SNS topic"
  value       = aws_sns_topic.terraform_sns.arn
}

output "sns_topic_name" {
  description = "The name of the created SNS topic"
  value       = aws_sns_topic.terraform_sns.name
}

output "sns_topic_id" {
  description = "The ID of the created SNS topic"
  value       = aws_sns_topic.terraform_sns.id
}

output "sns_subscription_id" {
  description = "The ID of the created SNS subscription"
  value       = aws_sns_topic_subscription.terraform_subscription.id
}

output "sns_subscription_arn" {
  description = "The ARN of the created SNS subscription"
  value       = aws_sns_topic_subscription.terraform_subscription.arn
}

output "sns_subscription_endpoint" {
  description = "The endpoint of the created SNS subscription"
  value       = aws_sns_topic_subscription.terraform_subscription.endpoint
}

output "sns_subscription_protocol" {
  description = "The protocol of the created SNS subscription"
  value       = aws_sns_topic_subscription.terraform_subscription.protocol
}

output "sns_subscription_topic_arn" {
  description = "The ARN of the SNS topic of the created SNS subscription"
  value       = aws_sns_topic_subscription.terraform_subscription.topic_arn
}


