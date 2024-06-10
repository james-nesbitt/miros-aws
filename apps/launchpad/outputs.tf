output "launchpad_yaml" {
  description = "launchpad config file yaml (for debugging)"
  sensitive   = true
  value       = local.launchpad_yaml_14
}

output "mke_connect" {
  description = "Connection information for connecting to MKE"
  sensitive   = true
  value = {
    host     = local.MKE_URL
    username = var.launchpad.mke_connect.username
    password = var.launchpad.mke_connect.password
    insecure = var.launchpad.mke_connect.insecure
  }
}
