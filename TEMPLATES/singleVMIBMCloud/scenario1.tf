provider "ibm" {}

module "camtags" {
  source = "../Modules/camtags"
}

variable "public_ssh_key" {
  description = "Public SSH key used to connect to the virtual guest"
}

variable "datacenter" {
  description = "Softlayer datacenter where infrastructure resources will be deployed"
}

variable "hostname" {
  description = "Hostname of the virtual instance (small flavor) to be deployed"
  default     = "debian-small"
}

# This will create a new SSH key that will show up under the \
# Devices>Manage>SSH Keys in the SoftLayer console.
resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}



variable "domain" {
  description = "VM domain"
}

# Create a new virtual guest using image "Debian"
resource "ibm_compute_vm_instance" "debian_small_virtual_guest" {
  hostname                 = "${var.hostname}"
  os_reference_code        = "DEBIAN_9_64"
  domain                   = "${var.domain}"
  datacenter               = "${var.datacenter}"
  network_speed            = 10
  hourly_billing           = true
  private_network_only     = false
  cores                    = 1
  memory                   = 1024
  disks                    = [25, 10, 20]
  user_metadata            = "{\"value\":\"newvalue\"}"
  dedicated_acct_host_only = false
  local_disk               = false
  ssh_key_ids              = ["${tls_private_key.mykey.id}"]
  tags                     = ["${module.camtags.tagslist}"]
}

output "vm_ip" {
  value = "${ibm_compute_vm_instance.debian_small_virtual_guest.ipv4_address}"
}

output "vm_public" {
  value = "${tls_private_key.mykey.public_key_openssh}"
}

output "vm_private" {
  value = "${tls_private_key.mykey.private_key_pem)}"
}

output "vm_public_urlenc" {
  value = "${urlencode(tls_private_key.mykey.public_key_openssh)}"
}

output "vm_private_urlenc" {
  value = "${urlencode(tls_private_key.mykey.private_key_pem)}"
}