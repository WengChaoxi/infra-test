# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------
variable "folder_full_name" {
  description = "The full name of the jenkins folder."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------
variable "folder_display_name" {
  description = "The display name of the jenkins folder."
  type        = string
  default     = ""
}

variable "folder_description" {
  description = "The description of the jenkins folder."
  type        = string
  default     = ""
}

# The list of the shared libraries, If there is only one element, you can pass it in as a Map:
# - name (string: <required>) - The name of the shared library.
# - version (string: <required>) - The version of the shared library.
# - implicit (bool: false) - If set true, scripts will automatically have access to this library without needing to request it via @Library.
# - allow_version_override (bool: false) - If set true, scripts may select a custom version of the library by appending @someversion in the @Library annotation. Otherwise they are restricted to using the version you select here.
# - include_in_change_sets (bool: flase) - If set true, any changes in the library will be included in the changesets of a build, and changing the library would cause new builds to run for Pipelines that include this library.
# - cache_config (map: null) - If set, versions fetched using this library will be cached on the controller.
#   Map element parameters:
#   - refresh_time (int: 0) - Determines the amount of time until the cache is refreshed. A value lower or equal to zero means that the cache will never be refreshed.
#   - wildcard_exclude (string: "") - Space separated list of versions to exclude from caching via substring search using .contains() method. Ex: "release/ master release10 release9".
# - git (map: <required>) - The git config of the shared library.
#   Map element parameters:
#   - remote (string: <required>) - The address of the git.
#   - credential_id (string: <optional>) - The ID of the git credential.
#     The `credential_id` for the following address is automatically filled in:
#     - https://github.com/kingsoftgames: `github`
# - library_path (string: "") - A relative path from the root of the SCM to the root of the library.
variable "shared_libraries" {
  description = "The pipeline libraries config of the folder."
  type        = any
  default     = null
}

# The list of the folder properties, If there is only one element, you can pass it in as a Map:
# - name (string: "")
# - value (string: "")
variable "folder_properties" {
  description = "A list of simple String properties you can expose to the jobs contained in this folder."
  type        = any
  default     = null
}

# Map element parameters:
# - settings_config_id (string: <optional>) - Use the provided settings.xml for this project by `settings_config_id`, E.G. `shiyou`
variable "maven_config" {
  description = "The maven config of the folder."
  type        = map(string)
  default     = null
}
