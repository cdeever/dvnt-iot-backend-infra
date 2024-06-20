variable "proxmox_config" {
  description = "Proxmox configuration settings"
  type = map(string)
}

variable "inventory" {
  type = map(object({
    ip       = string
    hostname = string
  }))
}
