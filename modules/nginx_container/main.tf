terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_image" "nginx" {
  name = var.image_name
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name

  ports {
    internal = var.internal_port
    external = var.external_port
  }

  # Restart policy
  restart = "unless-stopped"
}
