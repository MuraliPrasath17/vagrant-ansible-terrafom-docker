
resource "docker_image" "nginx" {
  name = "nginx:stable-perl"
}

resource "docker_container" "nginx" {
  image = "docker_image.nginx:stable-perl"
  name  = "nginx-server"
  ports {
    internal = 80
    external = 8080
  }
}


terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}


provider "docker" {
  host = "unix:///var/run/docker.sock"
}
