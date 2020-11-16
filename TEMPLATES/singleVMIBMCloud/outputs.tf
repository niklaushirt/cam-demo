output "vm_ip" {
  value = "${ibm_compute_vm_instance.debian_small_virtual_guest.ipv4_address}"
}

output "vm_public" {
  value = "${tls_private_key.mykey.public_key_openssh}"
}

output "vm_private" {
  value = "${tls_private_key.mykey.private_key_pem}"
}

output "vm_public_urlenc" {
  value = "${urlencode(tls_private_key.mykey.public_key_openssh)}"
}

output "vm_private_urlenc" {
  value = "${urlencode(tls_private_key.mykey.private_key_pem)}"
}