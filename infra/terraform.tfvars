# Profile
# - 'github-actions' is the github actions profile
# - 'localstack' is the localstack profile
# - 'default' is the default profile
profile                       = "github-actions"
region                        = "us-east-1"
queue_name                    = "my-queue"
topic_name                    = "my-topic"
visibility_timeout_seconds    = 30
message_retention_seconds     = 60
delay_seconds                 = 0
max_message_size_bytes        = 262144
message_wait_time_seconds     = 0
receive_wait_time_seconds     = 0
deadletter_max_receive_count  = 5
deadletter_name               = "my-queue-dlq"
deadletter_visibility_timeout = 30
deadletter_message_retention  = 60
deadletter_delay_seconds      = 0
deadletter_max_message_size   = 262144
deadletter_message_wait_time  = 0
deadletter_receive_wait_time  = 0
destroy_infra                 = true

tags = {
  Environment = "dev"
  Description = "This is a queue"
  Department  = "engineering"
}

