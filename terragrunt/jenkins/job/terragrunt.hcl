terraform {
  source = "../../../terraform/jenkins/job"
  # backend "s3" {
  #   bucket = ""
  # }
}

inputs = {
  # server_url = "http://127.0.0.1/"
  # username   = "admin"
  # password   = "admin"
  # ca_cert    = ""

  job_name         = "docker-library"
  job_folder       = "Personal/wengchaoxi/test"
  job_description  = "it's just a test"
  git_remote       = "git@git.shiyou.kingsoft.com:infra/docker-library.git"
  credentials_id   = "jenkins.ssh"
  jenkinsfile_path = "jenkins/jenkins-artifact/Jenkinsfile"
}
