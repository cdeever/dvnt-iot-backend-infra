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

data "external" "ansible_inventory" {
  program = ["python3", "${path.module}/scripts/read_inventory.py"]

  query = {
    inventory_file = "${path.module}/../ansible/inventory/${terraform.workspace}_inventory.yaml"
  }
}

locals {

  inventory_raw = data.external.ansible_inventory.result

  inventory = {
    for k, v in local.inventory_raw : k => {
      ip       = split("|", v)[0],
      hostname = split("|", v)[1]
    }
  }
}



module "vm_instance" {
  source = "./modules/proxmox/vm_instance"

  # Pass variables to the module
  name = "iot-logagg"

  # Add other required variables
  proxmox_config = var.proxmox_config

  providers = {
    proxmox = proxmox
  }
}


resource "proxmox_vm_qemu" "iot_web_vm" {


}

resource "proxmox_vm_qemu" "iot_logagg_vm" {

}

resource "proxmox_vm_qemu" "iot_mqtt_vm" {

}

resource "proxmox_vm_qemu" "iot_api_vm" {

}

resource "proxmox_vm_qemu" "iot_monitor_vm" {

}

