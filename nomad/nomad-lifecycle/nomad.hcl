job "lifecycle-test" {
  datacenters = ["dc1"]
	type = "batch"

  group "lifecycle-test" {
    task "task_prestart" {
			lifecycle {
				hook = "prestart"
				sidecar = false
			}
			driver = "exec"
			config {
				command = "sh"
				args = ["-c", "sleep 5; for i in 0 1 2 3 4 5 6 7 8 9; do curl -sL 'http://test.wengcx.top/task_prestart'; sleep 1; done"]
			}
      resources {
        cpu    = 20
        memory = 50
      }
    }

		task "task_poststop" {
			lifecycle {
				hook = "poststop"
				sidecar = false
			}
			driver = "exec"
			config {
				command = "sh"
				args = ["-c", "for i in 0 1 2 3; do curl -sL 'http://test.wengcx.top/task_poststop'; sleep 3; done"]
			}
      resources {
        cpu    = 20
        memory = 50
      }
    }

		task "task_poststart" {
			lifecycle {
				hook = "poststart"
				sidecar = false
			}
			driver = "exec"
			config {
				command = "sh"
				args = ["-c", "for i in 0 1 2 3; do curl -sL 'http://test.wengcx.top/task_poststart'; sleep 5; done"]
			}
			resources {
        cpu    = 20
        memory = 50
      }
    }

		task "main_task111" {
			driver = "exec"
			config {
				command = "sh"
				args = ["-c", "for i in 0 1 2 3 4 5 6 7 8 9 10 11 12; do curl -sL 'http://test.wengcx.top/main_task111111'; sleep 3; done"]
			}
			resources {
        cpu    = 20
        memory = 50
      }
		}

		task "main_task222" {
			driver = "exec"
			config {
				command = "sh"
				args = ["-c", "for i in 0 1 2 3 4 5 6 7 8 9 10 11 12; do curl -sL 'http://test.wengcx.top/main_task222222'; sleep 5; done"]
			}
			resources {
        cpu    = 20
        memory = 50
      }
		}
  }
}
