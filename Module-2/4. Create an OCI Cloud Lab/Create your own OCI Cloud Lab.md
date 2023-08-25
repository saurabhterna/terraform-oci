

```markdown
# Create Your Own OCI Cloud Lab using Terraform

This repository contains Terraform scripts to set up a custom Oracle Cloud Infrastructure (OCI) lab environment. The scripts provided here will help you create essential IAM resources, set up quotas and policies, and establish a controlled environment for learners to practice OCI services.

## Scripts

The repository includes the following Terraform scripts:

1. **provider.tf**: Specifies the OCI provider and required configuration details.
2. **variables.tf**: Defines the variables used in the Terraform configuration.
3. **createiamresources.tf**: Creates a compartment, user with credentials, group, and maps users to the group.
4. **quota.tf**: Defines quota policies to manage and restrict resource consumption within compartments.
5. **policies.tf**: Sets up required IAM policies for various resources.

## Usage

Follow these steps to set up your own OCI Cloud Lab using the provided scripts:

1. Clone this repository to your local machine:

   ```sh
   git clone https://github.com/your-username/oci-cloud-lab.git
   ```

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

- This OCI Cloud Lab is designed as a small-scale use case, allowing trainers to create lab environments for learners.
- Future updates to this repository will include scripts to automatically destroy the lab environment after a specified duration using OCI functions.
- Make sure to manage access and permissions carefully to ensure the security of the lab environment.


## Contributing

Contributions to this repository are welcome! If you find any issues or have ideas for improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
```
