module "tf-module-kvm-vm" {
  source                  = "git@github.com:k-candidate/tf-module-kvm-vm.git?ref=v1.4.1"
  image_source            = "https://cloud-images.ubuntu.com/releases/noble/release/ubuntu-24.04-server-cloudimg-amd64.img"
  network_name            = "default"
  vm_name                 = "tf-vm-test"
  use_cloud_init          = true
  cloud_init_cfg_filename = "user-data.cfg"
  cloud_init_vars = {
    vm_username = "ubuntu"
    ssh_public_key = file("~/.ssh/id_rsa.pub")
  }
  ssh_private_key = "~/.ssh/id_rsa"
  vm_username = "ubuntu"
}