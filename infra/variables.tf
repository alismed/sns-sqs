variable "region" {
  type        = string
  default     = ""
  description = "AWS region"
}

variable "profile" {
  type        = string
  description = "AWS profile to use"
  default     = "default"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to all resources"
}

variable "queue_name" {
  type        = string
  default     = ""
  description = "description"
}

variable "deadletter_name" {
  type        = string
  default     = ""
  description = "description"
}

variable "visibility_timeout_seconds" {
  type        = number
  default     = 30
  description = "description"
}

variable "message_retention_seconds" {
  type        = number
  default     = 345600
  description = "description"
}

variable "delay_seconds" {
  type        = number
  default     = 0
  description = "description"
}

variable "max_message_size_bytes" {
  type        = number
  default     = 262144
  description = "description"
}

variable "message_wait_time_seconds" {
  type        = number
  default     = 0
  description = "description"
}

variable "receive_wait_time_seconds" {
  type        = number
  default     = 0
  description = "description"
}

variable "deadletter_delay_seconds" {
  type        = number
  default     = 0
  description = "description"
}

variable "deadletter_max_message_size" {
  type        = number
  default     = 262144
  description = "description"
}

variable "deadletter_max_receive_count" {
  type        = number
  default     = 3
  description = "Maximum number of times a message can be received before being moved to DLQ"
}

variable "deadletter_receive_wait_time" {
  type        = number
  default     = 0
  description = "The time for which a ReceiveMessage call will wait for a message to arrive in DLQ"
}

variable "deadletter_visibility_timeout" {
  type        = number
  default     = 30
  description = "The time in seconds that the message will be invisible in the DLQ"
}

variable "deadletter_message_wait_time" {
  type        = number
  default     = 0
  description = "The time for which a ReceiveMessage call will wait for a message to arrive in DLQ"
}

variable "deadletter_message_retention" {
  type        = number
  default     = 345600
  description = "The time in seconds that the message will be invisible in the DLQ"
}

variable "topic_name" {
  type        = string
  description = "Name of the SNS topic"
  default     = ""
}
