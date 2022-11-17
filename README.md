# Implementing virtual networking in Azure

Aim: use terraform to deploy virtual netwokring in Azure. [Source](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator/blob/master/Instructions/Labs/LAB_04-Implement_Virtual_Networking.md)
CLI driven workflow, used for a sole operator. State is stored locally.

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

