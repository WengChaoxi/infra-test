terraform {
  source = "../../../../terraform/jenkins/folder"
}


inputs = {
  folder_full_name    = "Personal"
  folder_display_name = "hhhh"
  folder_description  = "it is just a test"
  shared_libraries = {
    name                   = "jenkins-shared-libraries"
    version                = "master"
    implicit               = true
    allow_version_override = true
    include_in_change_sets = false
    cache_config = {
      refresh_time     = 10
      wildcard_exclude = "dev"
    }
    git = {
      remote = "https://github.com/kingsoftgames/jenkins-shared-libraries.git"
    }
  }
  folder_properties = [
    {
      name  = "PROJECT"
      value = "infra"
    },
    {
      name  = "PROJECT_2"
      value = "paopao"
    }
  ]
  maven_config = {
    settings_config_id        = "shiyou"
    settings_file_path        = "/path/to/settings.xml"
    global_settings_file_path = "/path/to/settings.xml"
  }

  sub_folders = [
    {
      folder_full_name   = "Personal/wengchaoxi"
      folder_description = "xxx"
    },
    {
      folder_full_name   = "Personal/wengchaoxi/test"
      folder_description = "xxx"
    },
    {
      folder_full_name   = "Personal/wengchaoxi/test/for-jenkins"
      folder_description = "xxx"
    },
    {
      folder_full_name   = "Personal/wengchaoxi/test/for-harbor"
      folder_description = "xxx"
    }
  ]

}
