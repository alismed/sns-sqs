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
