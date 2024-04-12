terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version : "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx8080" {
  image = docker_image.nginx.latest
  name  = "nginx8080"
  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_container" "nginx8081" {
  image = docker_image.nginx.latest
  name  = "nginx8081"
  ports {
    internal = 80
    external = 8081
  }
}

resource "docker_container" "nginx8082" {
  image = docker_image.nginx.latest
  name  = "nginx8082"
  ports {
    internal = 80
    external = 8082
  }
}
