# vSphere Demo

* vSphere Connection must be named `vSphereHome`
* Ansible Tower must be integrated as `AnsibleTower`
* Ansible Templates lodaed from https://github.com/niklaushirt/ansible-demo



## Import Templates
https://github.com/niklaushirt/cam-demo

TEMPLATES/singleVMWithPrivateSSHKeyVSPHERE

## Import Services

https://github.com/niklaushirt/cam-demo

SERVICES/DemoVirtualMachineonVMware/DemoVirtualMachineonVMware.json
SERVICES/DemoVMWorkloads/DemoVMWorkloads.json

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
* Ansible Tower must be integrated as `AnsibleTower`
* Ansible Templates lodaed from https://github.com/niklaushirt/ansible-demo


## Import Templates
https://github.com/niklaushirt/cam-demo

TEMPLATES/singleVMIBMCloud

## Import Services

https://github.com/niklaushirt/cam-demo

SERVICES/IBMCloud_VM_Ansible/IBMCloud_VM_Ansible.json

## Post install 

* Verify step references
* Replace Slack Webhooks (x2)








# AWS Demo

## Connection

* AWS must be named `EC2`
* Ansible Tower must be integrated as `AnsibleTower`
* Ansible Templates lodaed from https://github.com/niklaushirt/ansible-demo


## Import Templates
https://github.com/niklaushirt/cam-demo

TEMPLATES/singleVMAWS

## Import Services

https://github.com/niklaushirt/cam-demo

SERVICES/AWS_VM_Ansible/AWS_VM_Ansible.json

## Post install 

* Verify step references
* Replace Slack Webhooks (x2)




# Others

STUFF/EC2Demo/MyEC2Demo.json
STUFF/HybridApp/HybridApp.json
STUFF/HybridDemo/HybridDemo.json




