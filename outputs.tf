output "nginx_url" {
  description = "URL, unter der der Nginx-Container erreichbar ist"
  value       = "http://localhost:${var.external_port}"
}

output "container_id" {
  description = "ID des erstellten Containers"
  value       = module.nginx_container.container_id
}
