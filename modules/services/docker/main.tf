terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = var.docker_image
  keep_locally = false
}

resource "random_string" "random" {
  length           = 4
  special          = true
  override_special = "/@£$"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "${var.container_name}-${random_string.random.result}"

  ports {
    internal = var.internal_port
    external = var.external_port
  }
}


