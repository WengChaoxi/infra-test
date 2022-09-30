terraform {
  required_version = ">= 1.3"
  required_providers {
    jenkins = {
      source  = "kingsoftgames/jenkins"
      version = ">= 0.0.4"
    }
  }
}
