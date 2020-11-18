

output "ip_address" {
  value = "${length(aws_instance.aws_vm.public_ip) > 0 ? aws_instance.aws_vm.public_ip : aws_instance.aws_vm.private_ip}"
}


output "vm_public" {
  value = "${tls_private_key.mykey.public_key_openssh}"
}

output "vm_private" {
  value = "${tls_private_key.mykey.private_key_pem}"
}
