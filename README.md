# Implementing virtual networking in Azure with Terraform

Aim: use terraform to deploy virtual netwokring in Azure; in preparation for the AZ-104 exam. 

[AZ-104 lab source](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Instructions/Labs/LAB_04-Implement_Virtual_Networking.md)
 for a local CLI driven workflow, designed for a sole operator; with terraform state is stored locally.

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

