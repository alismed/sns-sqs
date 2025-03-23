profile                    = "localstack"
region                     = "us-east-1"
name                       = "myqueue"
visibility_timeout_seconds = 30
message_retention_seconds  = 60
delay_seconds              = 0
max_message_size_bytes     = 262144
message_wait_time_seconds  = 0
receive_wait_time_seconds  = 0
tags = {
  Environment = "dev"
  Description = "This is a queue"
  Department  = "engineering"
}


deadletter_max_receive_count  = 5
deadletter_name               = "myqueue-deadletter"
deadletter_visibility_timeout = 30
deadletter_message_retention  = 60
deadletter_delay_seconds      = 0
deadletter_max_message_size   = 262144
deadletter_message_wait_time  = 0
deadletter_receive_wait_time  = 0

destroy_infra = false
