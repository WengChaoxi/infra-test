terraform {
  source = "../../../terraform/jenkins/job"
  # backend "s3" {
  #   bucket = ""
  # }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "jenkins" {
  server_url = "http://127.0.0.1/"
  username   = "admin"
  password   = "admin"
}
EOF
}

inputs = {
  job_name         = "infra-test"
  job_folder       = "test"
  job_description  = "it's just a test"
  git_remote       = "https://github.com/wengchaoxi/infra-test.git"
  jenkinsfile_path = "jenkins/jenkins-artifact/Jenkinsfile"
}
