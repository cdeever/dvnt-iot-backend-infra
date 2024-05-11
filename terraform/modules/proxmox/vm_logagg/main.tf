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


resource "proxmox_vm_qemu" "iot-fedora-elk" {
  target_node = "pve"
  clone       = "fedora-server-40-1.14"
  name        = "IoT-Logger"

  agent       = 1

  cores       = 2
  sockets      = 1
  memory      = 8096
  onboot       = false
  bootdisk     = "scsi0"
  scsihw       = "lsi"

  disks {
    scsi {
      scsi0 {
        disk {
          storage   = "local-lvm-big"
          size         = 128
        }
      }
    }
  }
}

