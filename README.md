# Palo Alto Firewall Deployment with Gateway Load Balancer

## Deployment Scenarios

1. **Using AWS Landing Zone Accelerator (LZA) or Prebuilt VPC**:
    - Use the `existing-net` folder if you are using AWS Landing Zone Accelerator (LZA) or have prebuilt the VPC.

2. **Full Deployment**:
    - Use the `full-deploy` folder if the VPC has not been built.

## Topology Diagram

![Topology Diagram](topology.png)

## After Deployment

1. **Configure Each Device**:
    - SSH into each device and execute the following commands to set the admin password and configure the network:

    ```sh
    configure
    set mgt-config users admin password
    set network interface ethernet ethernet1/1 layer3 dhcp-client enable yes
    set network interface ethernet ethernet1/1 layer3 dhcp-client create-default-route yes
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