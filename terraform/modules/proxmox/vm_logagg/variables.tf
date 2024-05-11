variable "opnsense_key" {
  type        = string
  description = "API key for OPNsense."
}

variable "opnsense_secret" {
  type        = string
  description = "API secret for OPNsense."
}

variable "opnsense_url" {
  type        = string
  description = "URL for OPNsense API."
}

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

