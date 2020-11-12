# vSphere Demo

* vSphere Connection must be named `vSphereHome`
* Ansible Tower must be integrated
* Ansible Templates lodaed from https://github.com/niklaushirt/ansible-demo



## Import Templates
https://github.com/niklaushirt/cam-demo

TEMPLATES/singleVMWithPrivateSSHKey

## Import Services

https://github.com/niklaushirt/cam-demo

DemoVirtualMachineonVMware/DemoVirtualMachineonVMware.json
DemoVMWorkloads/DemoVMWorkloads.json

## Shared Parameters

vSphereManagedInventoryDefinitions_v1 of type `vsphere_managed_inventory_definition`
Adapt to your vSphere Instance (Datacenter, ResourcePool, ...)

## Post install 

* Verify step references
* Replace Slack Webhooks (x2)
* Verify SSH Keys




# IBM Cloud Demo

## Connection

* IBM Cloud must be named `IBM`
* Ansible Tower must be integrated
* Ansible Templates lodaed from https://github.com/niklaushirt/ansible-demo


## Import Templates
https://github.com/niklaushirt/cam-demo

TEMPLATES/singleVMIBMCloud

## Import Services

https://github.com/niklaushirt/cam-demo

IBMCloud_VM_Ansible/IBMCloud_VM_Ansible.json

## Post install 

* Verify step references
* Replace Slack Webhooks (x2)



# Others

EC2Demo/MyEC2Demo.json
HybridApp/HybridApp.json
HybridDemo/HybridDemo.json




