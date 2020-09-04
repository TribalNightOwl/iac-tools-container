terraform {
  required_version = ">= 0.12"
  required_providers {
    esxi = {
      version = "~> 1.7"
    }
  }
}

provider "esxi" {
  esxi_hostname      = var.esxi_host
  esxi_hostport      = "22"
  esxi_hostssl       = "443"
  esxi_username      = var.esxi_username
  esxi_password      = var.esxi_password
}

resource "esxi_guest" myvirtualmachine {
  guest_name     = "myvirtualmachine"
  numvcpus       = "4"
  memsize        = "8192"  # in Mb
  boot_disk_size = "200" # in Gb
  boot_disk_type = "thin"
  disk_store     = var.datastore
  guestos        = "centos-64"
  power          = "off"
  virthwver      = "13"
}