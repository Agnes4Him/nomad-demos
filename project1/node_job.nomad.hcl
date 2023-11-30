job "node-app-job" {
    type = "service"

    group "node-app-group" {
        count = 1
        network {
            mode = "host"
            port "app_port" {
                static = "8888"
                to = "3001"
            }
        }

        service {
            name = "node-app-svc"
            port = "app_port"
            provider = "nomad"
        }

        task "node-app-task" {
            driver = "docker"

            config {
                image = "my-node-app:1.0.0"
                ports = ["app_port"]
            }
        }
    }
}