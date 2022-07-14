
output "jenkins_job_detail" {
  description = "The detail description of the Jenkins job"
  value       = <<CONFIGURATION

  job_name           = "${var.job_name}"
  job_folder         = "${var.job_folder}"
  job_description    = "${var.job_description}"
  git_remote         = "${var.git_remote}"
  credentials_id     = "${var.credentials_id}"
  jenkinsfile_path   = "${var.jenkinsfile_path}"

CONFIGURATION
}
