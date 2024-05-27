
resource "proxmox_vm_qemu" "vm_instance" {
  target_node = var.node
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

