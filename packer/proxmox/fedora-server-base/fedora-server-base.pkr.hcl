

packer {
  required_plugins {
    name = {
      version = "~> 1"
      source  = "github.com/hashicorp/proxmox"
    }
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}


variable "proxmox_url" {
  type    = string
  default = "${env("TF_VAR_proxmox_url")}"
}

variable "proxmox_token_id" {
  type    = string
  default = "${env("TF_VAR_proxmox_token_id")}"
}

variable "proxmox_token_secret" {
  type    = string
  default = "${env("TF_VAR_proxmox_token_secret")}"
}

variable "proxmox_node" {
  type    = string
  default = "${env("TF_VAR_proxmox_node")}"
}


source "proxmox-iso" "fedora-kickstart" {
  
  boot_command = [
    "<wait5>",
    "c<wait>",
    "<enter><wait>",
    "linux (cd)/images/pxeboot/vmlinuz inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-40 ip=dhcp inst.cmdline inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/kickstart.cfg<enter><wait5>",
    "initrd (cd)/images/pxeboot/initrd.img<enter><wait15>", 
    "boot<enter>"
  ]

  boot_wait    = "10s"

  disks {
    disk_size         = "64G"
    storage_pool      = "local-lvm-big"
    type              = "scsi"
  }
  
  http_directory           = "http"
  insecure_skip_tls_verify = true
  iso_file                 = "local:iso/Fedora-Server-dvd-x86_64-40-1.14.iso"
  iso_checksum             = "none"

  network_adapters {
    bridge = "vmbr0"
    model  = "virtio"
  }
  
  proxmox_url          = "${var.proxmox_url}"
  username             = "${var.proxmox_token_id}"
  token                = "${var.proxmox_token_secret}"
  node                 = "${var.proxmox_node}"
  memory               = 4096
  cores                = 2
  sockets              = 2

  ssh_timeout                        = "60m"
  ssh_username                       = "a_autoprov"
  ssh_agent_auth                     = true
  qemu_agent                         = true
  template_description               = "Fedora Server 40-1.14, generated on ${timestamp()}"
  template_name                      = "fedora-server-40-1.14"
  unmount_iso                        = true
}

build {
  sources = [
    "source.proxmox-iso.fedora-kickstart"
  ]

  provisioner "ansible" {
    playbook_file = "${path.root}/ansible/prometheus_exporter.yml"

    extra_arguments = [
      "-vv" // Verbose mode
    ]
    sftp_command = "/usr/libexec/openssh/sftp-server -e"
    use_proxy = false
  }
}
