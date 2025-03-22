terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc1"
    }

    opnsense = {
      source = "gxben/opnsense"
    }
  }
}


locals {
  allowed_workspaces = ["dev", "prod"]
}

resource "null_resource" "check_workspace" {
  count = contains(local.allowed_workspaces, terraform.workspace) ? 0 : 1

  provisioner "local-exec" {
    command = "echo 'Running in an unsupported workspace: ${terraform.workspace}. Please switch to a supported workspace.' && exit 1"
  }
}


module "iot_backend" {
  source = "./modules/iot-backend"

  # Pass variables to the module
  inventory = local.inventory

  # Add other required variables
  proxmox_config = var.proxmox_config

  providers = {
    proxmox = proxmox
  }
}
