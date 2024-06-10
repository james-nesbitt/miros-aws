
output "nodegroups" {
  description = "Nodegroups with node lists"
  value       = local.nodegroups
  sensitive   = true
}

output "ingresses" {
  description = "Ingresses with dns information"
  value       = local.ingresses
}

output "platforms" {
  description = "Platforms used in the stack"
  value       = local.platforms_with_ami
  sensitive   = true
}

output "key" {
  description = "Path to the private key used with any ssh connections"
  value       = abspath(local_sensitive_file.ssh_private_key.filename)
}
