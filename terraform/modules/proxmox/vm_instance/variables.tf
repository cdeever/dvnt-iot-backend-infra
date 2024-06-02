variable "proxmox_config" {
  description = "Proxmox configuration settings"
  type = map(string)
}

variable "name" {
  type        = string
  description = "VM Name"
}

