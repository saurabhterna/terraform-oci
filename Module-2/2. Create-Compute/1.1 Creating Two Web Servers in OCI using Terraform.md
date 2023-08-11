
# Creating Two Web Servers in Oracle Cloud Infrastructure (OCI) using Terraform

This guide will walk you through the process of creating two Apache web servers in Oracle Cloud Infrastructure (OCI) using Terraform. The web servers will be deployed in a public subnet within a Virtual Cloud Network (VCN).

## Prerequisites

1. **Generate RSA Keys:**
   - Generate RSA keys if you don't have them already:
     ```shell
     ssh-keygen -t rsa -b 4096
     ```
   - Store the generated keys in the `~/.ssh` directory.

2. **Update Environment Variables:**
   - Open the `env-vars` file provided in the repository.
   - Update the values for `TF_VAR_private_key_path` and `TF_VAR_public_key_path` to point to your RSA private and public key files.

## Steps

1. **Clone the Repository:**
   - Open a Cloud Shell or your local terminal.
   - Create a directory named `createwebserver` and navigate to it:
     ```shell
     mkdir createwebserver && cd createwebserver
     ```
   - Clone the GitHub repository:
     ```shell
     git clone <repository-url>
     ```
     Replace `<repository-url>` with the actual URL of the GitHub repository.

2. **Initialize Terraform:**
   - Run the following commands:
     ```shell
     source env-vars
     terraform init
     ```

3. **Plan and Apply:**
   - Generate a Terraform plan:
     ```shell
     terraform plan
     ```
   - If the plan looks satisfactory, apply it:
     ```shell
     terraform apply
     ```
     Confirm by typing `yes` when prompted.

4. **Verification and Testing:**
   - Once Terraform completes, it will display the public IP addresses of the created web servers.
   - Open a web browser and navigate to the public IP addresses to test the Apache web servers.

5. **Destroy Resources:**
   - After verifying the resources, execute the following command to destroy them:
     ```shell
     terraform destroy
     ```
     Confirm by typing `yes` when prompted.

## Summary

Congratulations! You've successfully created two Apache web servers in Oracle Cloud Infrastructure using Terraform. This guide provided step-by-step instructions, from setting up your environment and deploying the servers to testing them and cleaning up afterward. Happy web serving!

**Note:** This guide offers a basic setup for educational purposes. In a production environment, additional configurations such as security groups and load balancers would be necessary for high availability and security.
