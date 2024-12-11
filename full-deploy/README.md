# Palo Alto Firewall Deployment with Gateway Load Balancer

## Prerequisites

1. **Update the `terraform.tfvars` file**:
    - Omit the access/secret access keys if the machine you are using already has AWS access.
    - Comment out `access_key` and `secret_key` in `main.tf` if omitted from the `tfvars` file.
    - Ensure the EC2 SSH keypair is created and downloaded. This will be used for SSH access later.
    - Update the AMI ID. Accept the Palo Alto firewall terms from the marketplace related to the AMI.

2. **Subnet Requirements**:
    - The subnet in the `tfvars` file must be at least a `/23` to accommodate multiple subnets.

3. **Availability Zones**:
    - 2 AZs are mandatory for the load balancer.

4. **Transit Gateway**:
    - Ensure the transit gateway is deployed.
    - Update the `tfvars` file with the `txid`.

## Topology Diagram

![Topology Diagram](topology.png)

## After Deployment

1. **Configure Each Device**:
    - SSH into each device and execute the following commands to set the admin password and configure the network:

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
    ```
2. **Setup Spoke VPCS**:
    - Traffic is intrazone by default, and Palo Alto allows intrazone traffic. Use security groups to isolate traffic as needed.
    - Spokes should connect to the txgw, with routing handled automatically. Ensure the spoke has a default route to the txgw for private subnets.
    - For public ingress access in spoke subnets:
      - Devices on the public subnet must have public IPs. Use a load balancer if possible.
      - Create a subnet in each AZ for the gateway load balancer endpoints with routes to the IGW and VPC CIDR.
      - Create an ingress subnet/route table attached to the IGW with routes to the appropriate gwlbe for each AZ.
      - Create a public subnet and route table per AZ with routes to the appropriate GLBE and VPC CIDR. Add routes to the transit gateway if needed.
      - Create additional route tables/subnets for private workloads with routes to the txgw.
