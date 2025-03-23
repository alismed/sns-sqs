locals {
  is_local_env = var.profile == "localstack"

  backend_config = {
    bucket                      = "alismed-terraform"
    key                         = "terraform.tfstate"
    region                      = "us-east-1"
    profile                     = var.profile
    endpoint                    = local.is_local_env ? "http://localhost:4566" : null
    skip_credentials_validation = local.is_local_env
    skip_metadata_api_check     = local.is_local_env
    force_path_style            = local.is_local_env
  }
}
