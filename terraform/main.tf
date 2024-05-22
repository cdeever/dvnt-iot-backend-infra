locals {
  allowed_workspaces = ["dev", "prod"]
}

resource "null_resource" "check_workspace" {
  count = contains(local.allowed_workspaces, terraform.workspace) ? 0 : 1

  provisioner "local-exec" {
    command = "echo 'Running in an unsupported workspace: ${terraform.workspace}. Please switch to a supported workspace.' && exit 1"
  }
}
