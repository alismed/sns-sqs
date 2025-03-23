
```shell
# Antes de executar o terraform, você precisa criar o bucket no LocalStack:
aws --endpoint-url=http://localhost:4566 s3 mb s3://alismed-terraform


# Using localstack
AWS_PROFILE=localstack terraform -chdir=infra init

terraform -chdir=infra validate

terraform -chdir=infra fmt

AWS_PROFILE=localstack terraform -chdir=infra init plan

AWS_PROFILE=localstack terraform -chdir=infra apply -auto-approve

AWS_PROFILE=localstack terraform -chdir=infra destroy -auto-approve
```