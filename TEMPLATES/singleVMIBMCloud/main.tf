

module "camtags" {
  source = "../Modules/camtags"
}


# Create UUID for VM and SSH Key Naming
resource "random_uuid" "myuuid" { }



# Create public and private throwaway SSH keys
resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}



# This will create a new SSH key that will show up under the \
# Devices>Manage>SSH Keys in the SoftLayer console.
resource "ibm_compute_ssh_key" "orpheus_public_key" {
  label      = "Demo Public Key-${var.hostname}-${random_uuid.myuuid.result}"
  public_key = "${tls_private_key.mykey.public_key_openssh}"
}



# Create a new virtual guest using image "Debian"
resource "ibm_compute_vm_instance" "debian_small_virtual_guest" {
  hostname                 = "${var.hostname}-${random_uuid.myuuid.result}"
  os_reference_code        = "CENTOS_7_64"
  domain                   = "${var.domain}"
  datacenter               = "${var.datacenter}"
  network_speed            = 10
  hourly_billing           = true
  private_network_only     = false
  cores                    = 1
  memory                   = 1024
  disks                    = [25, 10, 20]
  user_metadata              = "${data.template_cloudinit_config.app_userdata.rendered}"
  dedicated_acct_host_only = false
  local_disk               = false
  ssh_key_ids              = ["${ibm_compute_ssh_key.orpheus_public_key.id}"]
  tags                     = ["${module.camtags.tagslist}"]
}
