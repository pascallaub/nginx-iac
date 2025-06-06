terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"
}

provider "docker" {}

module "nginx_container" {
  source = "./modules/nginx_container"
  
  container_name  = var.container_name
  image_name      = var.image_name
  internal_port   = local.internal_http_port
  external_port   = var.external_port
}