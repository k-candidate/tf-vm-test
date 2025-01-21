terraform {
  required_version = ">= 1.10.0"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "= 0.7.1"
    }
  }
}

provider "libvirt" {
  uri = var.libvirt_uri
}

module "tf-module-kvm-vm" {
  source                  = "github.com/k-candidate/tf-module-kvm-vm.git?ref=v1.4.1"
  image_source            = "https://cloud-images.ubuntu.com/releases/noble/release/ubuntu-24.04-server-cloudimg-amd64.img"
  network_name            = "default"
  vm_name                 = "tf-vm-test"
  use_cloud_init          = true
  cloud_init_cfg_filename = "user-data.cfg"
  cloud_init_vars = {
    vm_username = "ubuntu"
    ssh_public_key = var.ssh_public_key
  }
  ssh_private_key = var.ssh_private_key
  vm_username = "ubuntu"
}