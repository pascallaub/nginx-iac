variable "container_name" {
  description = "Name des Nginx-Containers"
  type        = string
  default     = "nginx-updated-tf"
}

variable "image_name" {
  description = "Name des Nginx-Images"
  type        = string
  default     = "nginx:latest"
}

variable "external_port" {
  description = "Externer Port für HTTP"
  type        = number
  default     = 8080
}
