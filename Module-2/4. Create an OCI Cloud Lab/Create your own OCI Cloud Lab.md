# Create Your Own OCI Cloud Lab using Terraform

Welcome to the **Create Your Own OCI Cloud Lab using Terraform** repository! This repository provides a set of Terraform scripts that empower you to establish a personalized Oracle Cloud Infrastructure (OCI) lab environment effortlessly. With these scripts, you can create essential IAM resources, manage quotas and policies, and curate a secure and controlled learning space for OCI services.

## Introduction

In the ever-evolving landscape of cloud computing, hands-on experience is invaluable. Whether you're a trainer, educator, or a learner eager to explore OCI, this repository offers a practical solution. It enables trainers to generate isolated lab environments for their students, granting them the opportunity to practice OCI services within a restricted context. This repository isn't just about setting up cloud resources – it's about creating a space where knowledge transforms into tangible skills.

## Use Case

Imagine you're an OCI trainer with access to the OCI Console. You want to provide your learners with a controlled environment where they can experiment and learn without the risk of unintended changes. By utilizing the scripts in this repository, you can effortlessly create a dedicated compartment, generate user credentials, establish user groups, map users to those groups, enforce quotas, and set up essential policies. Learners can then access this secure environment to gain hands-on experience with OCI services.

## Scripts

This repository includes the following Terraform scripts:

1. **provider.tf**: Specifies the OCI provider and necessary configuration details.
2. **variables.tf**: Defines variables used in the Terraform configuration.
3. **createiamresources.tf**: Creates a compartment, generates user credentials, establishes groups, and maps users to groups.
4. **quota.tf**: Sets quota policies to efficiently manage and control resource consumption within compartments.
5. **policies.tf**: Configures essential IAM policies required for various OCI resources.

## Getting Started

To begin using these scripts and create your OCI Cloud Lab:

1. Clone this repository to your local machine:

   ```sh
   git clone https://github.com/saurabhterna/oci-cloud-lab.git

2. Modify the `variables.tf` file to set your desired variable values.

3. Initialize Terraform:

   ```sh
   terraform init
   ```

4. Review and apply the Terraform scripts:

   ```sh
   terraform apply
   ```

5. Once the lab environment is created, learners with access to the OCI Console can use it for practice within the restricted environment.

## Additional Notes

- Future updates to this repository will include scripts to automatically destroy the lab environment after a specified duration using OCI functions.
- Make sure to manage access and permissions carefully to ensure the security of the lab environment.


## Contributing

Contributions to this repository are welcome! If you find any issues or have ideas for improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
```
