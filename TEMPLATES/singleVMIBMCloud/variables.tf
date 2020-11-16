
variable "iaas_classic_username" {
  description = "Enter your IBM Infrastructure (SoftLayer) full username, you can get this using: https://control.bluemix.net/account/user/profile"
}


variable "iaas_classic_api_key" {
  description = "Enter your IBM Infrastructure (SoftLayer) API key, you can get this using: https://control.bluemix.net/account/user/profile"
}


variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API Key, you can get your IBM Cloud API key using: https://cloud.ibm.com/iam#/apikeys"
}


variable "datacenter" {
  description = "Softlayer datacenter where infrastructure resources will be deployed"
  default     = "fra02"
}


variable "hostname" {
  description = "Hostname of the virtual instance (small flavor) to be deployed"
  default     = "debian-small"
}


variable "domain" {
  description = "Domain of the virtual instance to be deployed"
  default     = "sample.com"
}


variable "os_code" {
  description = "The OS Reference Code"
  default     = "CENTOS_7_64"
}



