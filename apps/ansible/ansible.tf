
locals {
  unique_roles = [ for r in distinct([ for k, ng in local.nodegroups : ng.role ]) : { role: r, children: [ for ng in local.nodegroups : ng. name if ng.role == r ] } ]

  ansible_inventory = <<-EOT
%{for ng in local.nodegroups~}
# nodegroup:${ng.name}
${ng.name}:
  hosts:
%{for n in ng.nodes}
%{~if ng.connection == "ssh"~}
    ${n.id}:
      ansible_connection: ssh
      ansible_ssh_private_key_file: ${local.key}
      ansible_user: ${ng.ssh_user}
      ansible_host: ${n.public_ip}
%{~endif}
%{endfor}
%{endfor}
%{for r in local.unique_roles~}
# role:${r.role}
${r.role}:
  children:
%{for c in r.children~}
    ${c}
%{endfor}
%{endfor~}
  EOT
}

output "ansible_inventory" {
  description = "ansible inventory file"
  value       = local.ansible_inventory
}

# Create Ansible inventory file
resource "local_file" "ansible_inventory" {
  content  = local.ansible_inventory
  filename = "hosts.yaml"
}
