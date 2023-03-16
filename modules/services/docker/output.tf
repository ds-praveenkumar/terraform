output image_id {
  value       = docker_image.nginx.id
  sensitive   = true
  description = "docker image id"

}

output container_id {
  value       = docker_image.nginx.id
  sensitive   = true
  description = "docker container id"

}