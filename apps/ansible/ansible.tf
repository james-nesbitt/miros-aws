
locals {
  unique_roles = [ for r in distinct([ for k, ng in local.nodegroups : ng.role ]) : { role: r, children: [ for ng in local.nodegroups : ng.name if ng.role == r ] } ]

  ansible_inventory = <<-EOT
all:
  hosts:
%{for ng in local.nodegroups~}
%{for n in ng.nodes}
%{~if ng.connection == "ssh"~}
    ${n.id}:
      ansible_connection: ssh
      ansible_ssh_private_key_file: ${local.key}
      ansible_user: ${ng.ssh_user}
      ansible_host: ${n.public_ip}
%{~endif}
%{endfor}
%{endfor~}
  children:
%{for r in local.unique_roles~}
    # role:${r.role}
    ${r.role}:
      hosts:
%{for c in r.children~}
%{for n in local.nodegroups[c].nodes~}
        ${n.id}:
%{endfor~}
%{endfor}
%{endfor~}
%{for ng in local.nodegroups~}
    # nodegroup:${ng.name}
    ${ng.name}:
      hosts:
%{for n in ng.nodes~}
        ${n.id}:
%{endfor}
%{endfor~}

  vars:
    mke_version: 3.7.9

EOT
}

output "ansible_inventory" {
  description = "ansible inventory file"
  value       = local.ansible_inventory
}

# Create Ansible inventory file
resource "local_file" "ansible_inventory" {
  content  = local.ansible_inventory
  filename = "inventory/01_hosts.yaml"
}
