variable "folder_full_name" {
  description = "The full name of the jenkins folder."
  type        = string
}

# variable "name" {
#   description = "x"
#   type        = string
# }

# variable "folder" {
#   description = "x"
#   type        = string
#   default     = null
# }

data "jenkins_job_config" "this" {
  name   = local.name
  folder = local.full_folder
}

locals {
  str_list    = split("/", var.folder_full_name)
  name        = local.str_list[length(local.str_list) - 1]
  folder      = join("/", slice(local.str_list, 0, length(local.str_list) - 1))
  full_folder = local.folder != "" ? replace("/${local.folder}", "/", "/job/") : ""

  is_empty = data.jenkins_job_config.this.config != null ? false : true
}

output "is_empty" {
  value = local.is_empty
}
