terraform {
  ## The configuration for this backend will be filled in by terragrunt
  # backend "s3" {}

  required_version = ">= 1.0"
  required_providers {
    jenkins = {
      source  = "taiidani/jenkins"
      version = ">= 0.9.2"
    }
  }
}
