terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

resource "proxmox_vm_qemu" "iot-logagg" {

  target_node = var.proxmox_config.proxmox_node
  clone       = "fedora-server-40-1.14"
  name        = lookup(var.inventory, "iot-logagg", { hostname = "not-in-inventory", ip = "unknown" }).hostname
  agent       = 1

  cores    = 2
  sockets  = 1
  memory   = 8096
  onboot   = false
  bootdisk = "scsi0"
  scsihw   = "lsi"

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm-big"
          format  = "qcow2"
          size    = 128
        }
      }
    }
  }
  timeouts {
    create = "60m"
    update = "30m"
    delete = "30m"
  }
}

resource "proxmox_vm_qemu" "iot-web" {

  target_node = var.proxmox_config.proxmox_node
  clone       = "fedora-server-40-1.14"
  name        = lookup(var.inventory, "iot-web", { hostname = "not-in-inventory", ip = "unknown" }).hostname
  agent       = 1

  cores    = 2
  sockets  = 1
  memory   = 8096
  onboot   = false
  bootdisk = "scsi0"
  scsihw   = "lsi"

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm-big"
          size    = 128
        }
      }
    }
  }
  timeouts {
    create = "60m"
    update = "30m"
    delete = "30m"
  }
}
