# Palo Alto Firewall Deployment

## Prerequisites

1. **Update the `terraform.tfvars` file**:
   - You can omit the access/secret access keys if the machine you are running this on already has access to AWS.
   - Be sure to comment out `access_key` and `secret_key` in `main.tf` if you choose to omit them from the `tfvars` file.
   - The ec2 ssh keypair must already be created and downloaded. You'll use this to SSH in later. Don't lose it!
   - You need to update the ami id. You should have already accepted whatever palo alto firewall terms from marketplace related to the ami. This is important!

2. **Subnet Requirements**:
   - The subnet in the `tfvars` file must be at least a `/23`. We are deploying a bunch of subnets.

3. **Availability Zones**:
   - 2 AZs are mandatory. The load balancer requires 2.

4. **Transit Gateway**:
   - The transit gateway must already be deployed.
   - Be sure to update the `tfvars` file with the `txid`.

## Topology Diagram

![Topology Diagram](topology.png)

## After Deployment

1. **Configure Each Device**:
   - SSH into each device and copy/paste the following commands. The first `set` command will set the admin password for the web admin. This is user interactive.

   ```sh
   configure
   set mgt-config users admin password
   set network interface ethernet ethernet1/1 layer3 dhcp-client enable yes
   set network interface ethernet ethernet1/1 layer3 dhcp-client accept-default-route yes
   set network profiles interface-management-profile https-healthcheck https yes
   set network interface ethernet ethernet1/1 layer3 interface-management-profile https-healthcheck
   set zone data network layer3 ethernet1/1
   set network virtual-router default interface ethernet1/1
   commit