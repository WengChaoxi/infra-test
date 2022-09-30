# Jenkins Multibranch Pipeline

Jenkins Folder as Code

## Configurations

```sh
export JENKINS_URL="<JENKINS_URL>"
export JENKINS_USERNAME="<JENKINS_USERNAME>"
export JENKINS_PASSWORD="<JENKINS_PASSWORD>"
export JENKINS_CA_CERT="<JENKINS_CA_CERT>" # Optional
```

## Usage

### Example

```hcl
folder_full_name   = "Personal"
folder_description = "it's just a test"

shared_libraries = {
  name                   = "jenkins-shared-libraries"
  version                = "master"
  implicit               = true
  allow_version_override = true
  git = {
    remote = "https://github.com/wengchaoxi/jenkins-shared-libraries.git"
  }
}

folder_properties = {
  name  = "PROJECT"
  value = "infra"
}

maven_config = {
  settings_config_id = "shiyou"
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
```

## References

- https://registry.terraform.io/providers/kingsoftgames/jenkins/latest/docs
