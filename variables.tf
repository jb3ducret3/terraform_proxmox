variable "pm_api_url" {
  default = "https://mon_serveur_proxmox/api2/json"
}

variable "pm_user" {
  default = "votre_login_proxmox"
}

variable "pm_password" {
  default = "le_password_proxmox"
}

variable "ssh_key" {
  default = "ssh-rsa votre_clé_publique"
}
