resource "null_resource" "set_initial_state" {
  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = "echo \"0\" > counter"
  }
}

module "folders" {
  source = "./folder"

  for_each            = local.folders
  index               = each.key
  folder_full_name    = each.value.folder_full_name
  folder_display_name = each.value.folder_display_name
  folder_description  = each.value.folder_description
  shared_libraries    = each.value.shared_libraries
  folder_properties   = each.value.folder_properties
  maven_config        = each.value.maven_config
}

locals {
  folders = merge(
    { 0 = {
      folder_full_name    = var.folder_full_name
      folder_display_name = var.folder_display_name
      folder_description  = var.folder_description
      shared_libraries    = var.shared_libraries
      folder_properties   = var.folder_properties
      maven_config        = var.maven_config
    } },
    { for i, f in var.sub_folders : i + 1 => {
      folder_full_name    = lookup(f, "folder_full_name")
      folder_display_name = lookup(f, "folder_display_name", replace(f["folder_full_name"], "/.*//", ""))
      folder_description  = lookup(f, "folder_description", "")
      shared_libraries    = lookup(f, "shared_libraries", [])
      folder_properties   = lookup(f, "folder_properties", [])
      maven_config        = lookup(f, "maven_config", {})
  } }, )
}

output "folders" {
  value = module.folders
}
