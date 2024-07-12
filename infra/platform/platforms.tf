//
// "274458771119/mkex-8-mcr-20.10-ec2-devel-20240219.0"
// "274458771119/mcp-8-mcr-23.0-ec2-devel-20230616.0"
// "274458771119/mcp-8-mcr-23.0-ec2-devel-20230901.0"
// "274458771119/mcp-8-mcr-20.10-ec2-devel-20230901.0"
// "274458771119/mkex-8-mke-3.6-ec2-devel-20240219.0"
// "274458771119/mkex-8-mke-3.6-ec2-devel-20240322.0"
// "274458771119/mkex-8-mke-3.7-ec2-devel-20240322.0"
// "274458771119/mkex-8-mcr-23.0-ec2-devel-20240322.0"
// "274458771119/mkex-8-mcr-23.0-ec2-devel-20240219.0"
// "274458771119/mcp-8-mcr-20.10-ec2-devel-20230616.0"
// "274458771119/mkex-8-mke-3.7-ec2-devel-20240219.0"


locals {
  // this is the idea of @jcarrol who put this into a lib map. Here we steal his idea
  lib_platform_definitions = {
    "mkex-8-mke-3.6" : {
      "ami_name" : "mkex-8-mke-3.6-ec2-devel-*",
      "owner" : "274458771119",
      "interface" : "eth0"
      "connection" : "ssh",
      "ssh_user" : "rocky",
      "ssh_port" : 22
    },
    "mkex-8-mke-3.7" : {
      "ami_name" : "mkex-8-mke-3.7-ec2-devel-*",
      "owner" : "274458771119",
      "interface" : "eth0"
      "connection" : "ssh",
      "ssh_user" : "rocky",
      "ssh_port" : 22
    },
    "mkex-8-mcr-23" : {
      "ami_name" : "mkex-8-mcr-23.0-ec2-devel-*",
      "owner" : "274458771119",
      "interface" : "eth0"
      "connection" : "ssh",
      "ssh_user" : "rocky",
      "ssh_port" : 22
    },
    "mkex-8-mcr-20" : {
      "ami_name" : "mkex-8-mcr-20.10-ec2-devel-*",
      "owner" : "274458771119",
      "interface" : "eth0"
      "connection" : "ssh",
      "ssh_user" : "rocky",
      "ssh_port" : 22
    },

    "mkex-8-23.0.9-3.7.5" : {
      "ami_name" : "mkex-8-mke-3.7-ec2-devel-20240219.*",
      "owner" : "274458771119",
      "interface" : "eth0"
      "connection" : "ssh",
      "ssh_user" : "rocky",
      "ssh_port" : 22
    },
    "mkex-8-23.0.10-3.7.6" : {
      "ami_name" : "mkex-8-mke-3.7-ec2-devel-20240322.*",
      "owner" : "274458771119",
      "interface" : "eth0"
      "connection" : "ssh",
      "ssh_user" : "rocky",
      "ssh_port" : 22
    },


  }
}
