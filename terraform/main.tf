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

resource "digitalocean_droplet" "application" {
    image = "ubuntu-22-04-x64"
    name = "application"
    region = "fra1"
    size = "s-1vcpu-2gb"
    ssh_keys = [digitalocean_ssh_key.default.id]
    tags = ["application", "env:staging"]
}

resource "digitalocean_project" "stage-community-platform-infrastructure" {
  name        = "stage community platform infrastructure"
  description = "An staging infrastructure for the community platform"
  purpose     = "Staging Community Platform"
  environment = "Staging"
  resources   = [digitalocean_droplet.application.urn]
}
