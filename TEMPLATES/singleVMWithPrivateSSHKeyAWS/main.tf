#################################################################
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# ©Copyright IBM Corp. 2017, 2018.
#
#################################################################


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
resource "ibm_compute_ssh_key" "vm_public_key" {
  label      = "Demo Public Key-${var.hostname}-${random_uuid.myuuid.result}"
  public_key = "${tls_private_key.mykey.public_key_openssh}"
}




resource "aws_instance" "aws_vm" {
  instance_type = "${var.aws_image_size}"
  ami           = "${data.aws_ami.aws_ami.id}"
  subnet_id     = "${data.aws_subnet.selected.id}"
  key_name      = "${aws_key_pair.vm_public_key.id}"
  tags          = "${merge(module.camtags.tagsmap, map("Name", "${var.ibm_stack_name}-${random_uuid.myuuid.result}"))}"
}
