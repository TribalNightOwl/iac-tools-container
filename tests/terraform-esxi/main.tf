terraform {
  required_version = ">= 0.13"
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
      #
      # For more information, see the provider source documentation:
      # https://github.com/josenk/terraform-provider-esxi
      # https://registry.terraform.io/providers/josenk/esxi
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
