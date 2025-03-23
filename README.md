# SNS and SQS with Terraform and LocalStack

This project demonstrates how to create AWS infrastructure using SNS (Simple Notification Service) and SQS (Simple Queue Service) with Terraform and LocalStack.

## Architecture

- SNS Topic for publishing messages
- SQS Queue for receiving messages from SNS
- DLQ (Dead Letter Queue) for unprocessed messages
- IAM policies for access control

## Prerequisites

- AWS CLI
- Terraform
- LocalStack
- Docker (for LocalStack)

## Local Setup

1. Configure LocalStack profile:
```bash
aws configure set aws_access_key_id test --profile localstack
aws configure set aws_secret_access_key test --profile localstack
aws configure set region us-east-1 --profile localstack
aws configure set endpoint_url http://localhost:4566 --profile localstack
```

2. Create S3 bucket for Terraform state:
```bash
aws --endpoint-url=http://localhost:4566 s3 mb s3://alismed-terraform
```

## Terraform Commands
Local development

```bash
# Initialize localstack
localstack start -d

# Set AWS Profile for all commands
export AWS_PROFILE=localstack

# Initialize project:
terraform -chdir=infra init

# Validate configuration:
terraform -chdir=infra validate

# Format files:
terraform -chdir=infra fmt

# Plan changes:
terraform -chdir=infra plan

# Apply changes:
terraform -chdir=infra apply -auto-approve

# Destroy infrastructure:
terraform -chdir=infra destroy -auto-approve

# Unset AWS Profile (optional)
unset AWS_PROFILE

# Stop localstack
localstack stop
```

## Project Structure

```
.
├── README.md
└── infra/
    ├── main.tf                     # Main infrastructure resources (SNS, SQS, DLQ)
    ├── variables.tf                # Input variables configuration
    ├── provider.tf                 # AWS provider configuration
    ├── backend.tf                  # Terraform backend configuration
    ├── outputs.tf                  # Output values
    └── trust/                      # IAM and policy configurations
        ├── sqs-policy.json         # Main queue access policy
        ├── dlq-policy.json         # Dead letter queue policy
        └── sqs-redrive_policy.json # Queue redrive policy
```

## Resource Details

- **SNS Topic**: Publishes messages to subscribers
- **SQS Queue**: Receives and processes messages from SNS
- **Dead Letter Queue**: Handles failed message processing
- **IAM Policies**: Controls access between services