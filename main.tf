terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.48.1"
    }
  }
  cloud {
    hostname     = "app.terraform.io"
    workspaces {
      name = "hetzner-vps"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "default" {
  name       = "default-ssh-key"
  public_key = var.ssh_public_key
}

resource "hcloud_server" "web" {
  name        = "web-server"
  image       = "ubuntu-24.04"
  server_type = "cx11"
  location    = "nbg1"
  ssh_keys    = [hcloud_ssh_key.default.id]
}

