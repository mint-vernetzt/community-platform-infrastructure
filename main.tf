terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "token" {
    type = string
}

provider "digitalocean" {
    token = var.token
}

resource "digitalocean_ssh_key" "default" {
    name       = "Installation key"
    public_key = file("~/.ssh/id_ed25519.pub")
}

resource "digitalocean_droplet" "web" {
    image = "ubuntu-22-04-x64"
    name = "community"
    region = "fra1"
    size = "s-1vcpu-2gb"
    ssh_keys = [digitalocean_ssh_key.default.id]
    tags = ["web"]
}
