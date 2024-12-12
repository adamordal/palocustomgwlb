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