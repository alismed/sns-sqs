resource "aws_sns_topic" "terraform_sns" {
  name = "${var.name}-topic"
  tags = var.tags
}

resource "aws_sns_topic_subscription" "terraform_subscription" {
  topic_arn = aws_sns_topic.terraform_sns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.terraform_queue.arn
}