terraform {
  backend "s3" {
    bucket                      = local.backend_config.bucket
    key                         = local.backend_config.key
    region                      = local.backend_config.region
    endpoint                    = local.backend_config.endpoint
    skip_credentials_validation = local.backend_config.skip_credentials_validation
    skip_metadata_api_check     = local.backend_config.skip_metadata_api_check
    force_path_style            = local.backend_config.force_path_style
    profile                     = local.backend_config.profile
  }
}
