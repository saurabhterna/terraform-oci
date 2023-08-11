## Creating Apache Web Servers in Oracle Cloud Infrastructure (OCI) using Terraform

This guide will walk you through the process of creating two Apache web servers in Oracle Cloud Infrastructure (OCI) using Terraform. The web servers will be deployed in a public subnet within a Virtual Cloud Network (VCN). Before you begin, make sure you have Terraform installed and configured, and you have generated RSA keys for authentication.

### Prerequisites

1. Generate RSA Keys:
   - Generate RSA keys if you don't have them already: `ssh-keygen -t rsa -b 4096`
   - Store the generated keys in the `~/.ssh` directory.

2. Update Environment Variables:
   - Open the `env-vars` file provided in the repository.
   - Update the values for `TF_VAR_private_key_path` and `TF_VAR_public_key_path` to point to your RSA private and public key files.

### Steps

1. Clone the Repository:
   - Open a Cloud Shell or your local terminal.
   - Create a directory named `createwebserver` and navigate to it: `mkdir createwebserver && cd createwebserver`
   - Clone the GitHub repository: `git clone <repository-url>`.

2. Initialize Terraform:
   - Run `source env-vars` to load the environment variables.
   - Run `terraform init` to initialize Terraform and download the necessary providers.

3. Plan and Apply:
   - Run `terraform plan` to see the execution plan.
   - If the plan looks good, run `terraform apply` to create the web servers and related resources.

4. Verification and Testing:
   - After Terraform completes, it will display the public IP addresses of the created web servers.
   - Open a web browser and navigate to the public IP addresses to test the Apache web servers.

5. Destroy Resources:
   - Once you've verified the resources, it's important to clean up to avoid unnecessary costs.
   - Run `terraform destroy` to delete all the created resources.

### Summary

You've successfully created two Apache web servers in Oracle Cloud Infrastructure using Terraform. This guide provided you with step-by-step instructions, from setting up your environment and deploying the servers to testing them and cleaning up afterward. Happy web serving!

**Note:** Remember that this guide provides a basic setup for educational purposes. In a production environment, you'd likely need to configure security groups, load balancers, and other considerations for high availability and security.
