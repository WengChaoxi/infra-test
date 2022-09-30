# resource "null_resource" "wait" {
#   provisioner "local-exec" {
#     interpreter = ["bash", "-c"]
#     command     = "while ${local.is_wait}; do echo 'waiting for parent folder create...'; sleep 5; done"
#   }
# }

variable "index" {
  type    = number
  default = 0
}

resource "null_resource" "wait" {
  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = "while [[ $(cat counter) != \"${var.index}\" ]]; do echo 'waiting for parent folder create...'; sleep 5; done"
  }
}

resource "jenkins_folder_template" "this" {
  name   = local.name
  folder = local.full_folder

  template = templatefile("${path.module}/template.tftpl", {
    folder_display_name   = local.folder_display_name
    folder_description    = var.folder_description
    shared_libraries      = local.shared_libraries
    folder_properties     = local.folder_properties
    maven_config          = local.maven_config
    default_credential_id = local.default_credential_id
    plugins               = local.plugins
    xml_nodes             = local.xml_nodes
  })

  depends_on = [null_resource.wait]
}

# module "folder-config" {
#   source = "../folder-config"

#   folder_full_name = local.parent_folder
# }

resource "null_resource" "inc" {
  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = "echo \"${var.index + 1}\" > counter"
  }
  depends_on = [jenkins_folder_template.this]
}


data "jenkins_plugins" "this" {}

data "jenkins_job_config" "xml_node_icon" {
  name     = local.name
  folder   = local.full_folder
  xml_node = "icon"
}

locals {
  str_list            = split("/", var.folder_full_name)
  name                = local.str_list[length(local.str_list) - 1]
  folder              = join("/", slice(local.str_list, 0, length(local.str_list) - 1))
  full_folder         = local.folder != "" ? replace("/${local.folder}", "/", "/job/") : ""
  folder_display_name = var.folder_display_name != "" ? var.folder_display_name : local.name

  shared_libraries  = var.shared_libraries != null ? flatten([var.shared_libraries]) : []
  folder_properties = var.folder_properties != null ? flatten([var.folder_properties]) : []
  maven_config      = var.maven_config != null ? var.maven_config : {}

  # The credentials of the project
  credentials = {
    github = "github"
  }
  is_github_remote      = try(var.shared_libraries.git.remote == regex(".+github.com/kingsoftgames.+", var.shared_libraries.git.remote), false)
  default_credential_id = local.is_github_remote ? local.credentials.github : ""

  plugins = { for p in data.jenkins_plugins.this.plugins : p["name"] => format("%s@%s", p["name"], p["version"]) }

  xml_nodes = {
    icon = data.jenkins_job_config.xml_node_icon.config
  }

  # parent_folder = try(regex("^/*(.*)/[^/]+$", var.folder_full_name)[0], "")
  # is_wait       = local.parent_folder != "" ? module.folder-config.is_empty : false
}
