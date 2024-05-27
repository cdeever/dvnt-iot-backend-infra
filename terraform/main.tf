locals {
  allowed_workspaces = ["dev", "prod"]
}

resource "null_resource" "check_workspace" {
  count = contains(local.allowed_workspaces, terraform.workspace) ? 0 : 1

  provisioner "local-exec" {
    command = "echo 'Running in an unsupported workspace: ${terraform.workspace}. Please switch to a supported workspace.' && exit 1"
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

