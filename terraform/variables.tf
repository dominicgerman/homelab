variable "proxmox_node" {
  type    = string
  default = "pve"
}

variable "template_name" {
  type    = string
  default = "debian-13-cloud-template"
}

variable "bridge" {
  type    = string
  default = "vmbr0"
}

variable "gateway" {
  type = string
}

variable "cidr" {
  type    = number
  default = 24
}

variable "ssh_public_key" {
  type = string
}

variable "proxmox_endpoint" {}
variable "proxmox_api_token_id" {}
variable "proxmox_api_token_secret" {}
