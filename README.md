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
# Initialize localstack
localstack start -d

aws --endpoint-url=http://localhost:4566 s3 mb s3://alismed-terraform
```

## Terraform Commands
Local development

```bash
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
├── .github/
│   └── workflows/
│       ├── main.yaml              # Main workflow orchestrator
│       ├── 01-validate.yaml       # Variables validation workflow
│       ├── 02-terraform.yaml      # Terraform execution workflow
│       └── 03-notify.yaml         # PR notification workflow
└── infra/
    ├── main.tf                    # Main infrastructure resources (SNS, SQS, DLQ)
    ├── variables.tf               # Input variables configuration
    ├── provider.tf                # AWS provider configuration
    ├── backend.tf                 # Terraform backend configuration for AWS
    ├── backend.local.tf           # Terraform backend configuration for LocalStack
    ├── locals.tf                  # Local variables and environment configurations
    ├── outputs.tf                # Output values
    └── trust/                     # IAM and policy configurations
        ├── sqs-policy.json        # Main queue access policy
        ├── dlq-policy.json        # Dead letter queue policy
        └── sqs-redrive_policy.json # Queue redrive policy
```

## GitHub Actions

The workflow is divided into three stages:

1. **Validation (01-validate.yaml)**
    * Validates and reads terraform variables
    * Outputs variables for other stages

2. **Terraform Execution (02-terraform.yaml)**
    * Configures AWS credentials
    * Executes terraform init/plan/apply or destroy

3. **PR Notification (03-notify.yaml)**
    * Posts results back to the Pull Request
    * Formats success/failure messages

All stages are orchestrated by `main.yaml` which ensures proper execution order and data flow between stages.

## Testing GitHub Actions Locally

### Using Act
1. Install Act:
```bash
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

2. Setup test environment:
```bash
# Create test directory if not exists
mkdir -p .act

# Create env file with credentials
echo "AWS_ACCESS_KEY_ID=test" > .act/.env
echo "AWS_SECRET_ACCESS_KEY=test" >> .act/.env

# Create pull request event simulation
cat > .act/pull_request.json << EOF
{
  "pull_request": {
    "number": 1,
    "body": "Test PR",
    "head": {
      "ref": "feature/test"
    }
  }
}
EOF
```

3. Run workflows locally:
```bash
# List available workflows
act -C .act -l

# Run workflow with pull request event
act -C .act pull_request -e .act/pull_request.json

# Run specific workflow
act -C .act pull_request -W .github/workflows/01-validate.yaml -e .act/pull_request.json

# Run with verbose output
act -C .act -v pull_request -e .act/pull_request.json
```

## Resource Details

- **SNS Topic**: Publishes messages to subscribers
- **SQS Queue**: Receives and processes messages from SNS
- **Dead Letter Queue**: Handles failed message processing
- **IAM Policies**: Controls access between services

