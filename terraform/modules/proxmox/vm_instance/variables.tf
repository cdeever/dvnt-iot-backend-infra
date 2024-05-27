variable "proxmox_node" {
  type        = string
  description = "Node identifier in Proxmox."
}

variable "proxmox_token_id" {
  type        = string
  description = "Token ID for Proxmox API authentication."
}

variable "proxmox_token_secret" {
  type        = string
  description = "Secret for the Proxmox API token."
}

variable "proxmox_url" {
  type        = string
  description = "URL for Proxmox API."
}

