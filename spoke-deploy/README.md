# Spoke Deployment with Gateway Load Balancer
This deployment creates GWLB endpoints in 2 AZs for an existing endpoint services deployment. This will update the existing route tables with the appropriate routes to steer both incoming and outgoing traffic to any workloads deployed in the public subnets directly to the endpoint services firewall.

## Prerequisites

1. **Update the `terraform.tfvars` file**:
    - Omit the access/secret access keys if the machine you are using already has AWS access.
    - Comment out `access_key` and `secret_key` in `main.tf` if omitted from the `tfvars` file.
    - Ensure the EC2 SSH keypair is created and downloaded. This will be used for SSH access later.
    - Update the AMI ID. Accept the Palo Alto firewall terms from the marketplace related to the AMI.
    - Update the tag variables to match existing Name tags. Modify .tf files as necessary to match convention.

2. **Subnet Requirements**:
    - This version expects the following to be in place.
      - 4 Subnets in 2 AZs
        - 2 for Endpoints
        - 2 for Public Workloads

3. **Route Table Requirements**:
   - This version expects the following to be in place.
     - 5 Route Tables in 2 AZs
       - 2 for Public Workloads
       - 2 for Endpoints
       - 1 for Ingress/IGW

4. **Cloudformation IAM Policy**:
   - This version requires the iam_setup.yml to be deployed into the target account with the appropriate org id.


## File Structure

The Terraform configuration has been split into multiple files for better organization:

- `main.tf`: Contains initialization and setup configurations.
- `vpc_subnets.tf`: Contains data sources for existing VPC and subnets.
- `route_tables.tf`: Contains data sources for existing route tables.
- `transit_gateway.tf`: Contains resources for transit gateway configuration.
- `routes.tf`: Contains resources for route configurations.

