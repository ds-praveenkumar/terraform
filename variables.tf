variable "docker_image" {
  type        = string
  default     = "nginx"
  description = "Docker Image for Ngnix"
}

variable "container_name" {
  type        = string
  default     = "docker_nginx"
  description = "description"
}

variable "internal_port" {
  type    = number
  default = 80
}

variable "external_port" {
  type    = number
  default = 8000
}