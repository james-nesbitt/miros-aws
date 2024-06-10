data "terraform_remote_state" "infra" {
  backend = "local"

  config = {
    path = "../../infra/terraform.tfstate"
  }
}

locals {
  nodegroups = data.terraform_remote_state.infra.outputs.nodegroups
  key = data.terraform_remote_state.infra.outputs.key
}
