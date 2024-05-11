

provider "proxmox" {
  pm_api_url = var.proxmox_url
  pm_api_token_id = var.proxmox_token_id
  pm_api_token_secret = var.proxmox_token_secret
  pm_tls_insecure = true  // Set to false in production after setting up proper SSL
}


provider "opnsense" {
  password = a_autoprov 
  user = a_autoprov
  uri = var.opnsense_url
}


