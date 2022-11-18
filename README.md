# Implementing virtual networking in Azure with Terraform

Aim: use terraform to deploy virtual netwokring in Azure; in preparation for the AZ-104 exam. 

[AZ-104 lab source](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Instructions/Labs/LAB_04-Implement_Virtual_Networking.md) for a local CLI driven workflow, designed for a sole operator; with terraform state stored locally.

## Prerequisites

1. An understaning of terraform would help. Reference this [beginners guide to terraform](https://www.youtube.com/watch?v=YcJ9IeukJL8)
2. [Install terraform](https://developer.hashicorp.com/terraform/downloads)
3. [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)

## Setup

1. A resource group containing:
* A single virtual network with x2 subnets.
* x1 virtual machine, B series, within each subnet. 
* An attached public and private IP address for each virtual machine.
* A network security group applied at the NIC level of both virtual machines.
* Azure DNS configure for both internal and external name resolution

![image](https://user-images.githubusercontent.com/77082071/202557140-b0ab941f-79e8-4026-a4c3-9c5ad4110ba0.png)

2. Create a file: `terraform.tfvars` in the infra sub-folder
* Within the file add the variables below:

```
subscription_id = "00000000-0000-0000-0000-000000000000"
tenant_id       = "00000000-0000-0000-0000-000000000000"
vm_pwd          = "yourVmPasswordHere"
```
* Within the file: `virtual_machines.tf`, you can change the variable: `admin_username` to your preference.
> This will be the username used to authenticate to the virtual machines via RDP.


3. Within the infra subfolder, run commands:
* `terraform init`
* `terraform validate`
* `terraform plan -out="dns-config.tfplan"`
* `terraform apply --auto-approve ".\dns-config.tfplan"`
4. Customise the internal DNS domain name or external domain name in `dns.tf` to your preference.

## Useful Links

1. [Overview of DNS zones and records - Azure](https://learn.microsoft.com/en-us/azure/dns/dns-zones-records)
2. [Detailed troubleshooting steps for remote desktop connection issues to Windows VMs in Azure](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/detailed-troubleshoot-rdp)
3. [Network security groups](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview)