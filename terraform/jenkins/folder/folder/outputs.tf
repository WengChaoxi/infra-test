output "folder_full_name" {
  description = "The full name of the jenkins folder."
  value       = var.folder_full_name
}

output "folder_display_name" {
  description = "The display name of the jenkins folder."
  value       = local.folder_display_name
}

output "folder_description" {
  description = "The description of the jenkins folder."
  value       = var.folder_description
}
