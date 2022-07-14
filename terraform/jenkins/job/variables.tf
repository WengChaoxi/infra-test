# Required variables.
variable "server_url" {}
variable "username" {}
variable "password" {}

variable "job_name" {
  description = "The name of the Jenkins job"
}

variable "job_folder" {
  description = "The folder path of the Jenkins job"
}

# Optional variables.
variable "ca_cert" {
  default     = ""
  description = "This is the path to the self-signed certificate that may be required in order to authenticate to your Jenkins instance."
}

variable "job_description" {
  default     = ""
  description = "The description of the Jenkins job"
}

variable "git_remote" {
  default     = ""
  description = "The address of the Git"
}

variable "credentials_id" {
  default     = ""
  description = "The ID of the Credentials"
}

variable "jenkinsfile_path" {
  default     = "Jenkinsfile"
  description = "The path of the Jenkinsfile"
}
