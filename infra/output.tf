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

