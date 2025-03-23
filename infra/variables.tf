variable "region" {
  type        = string
  default     = ""
  description = "AWS region"
}

variable "profile" {
  type    = string
  default = "default"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to all resources"
}

variable "name" {
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
