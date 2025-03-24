terraform {
  backend "s3" {
    bucket                      = "alismed-terraform"
    key                         = "terraform.tfstate"
    region                      = "us-east-1"
    endpoint                    = "http://localhost:4566"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style           = true
    profile                    = "localstack"
  }
}
