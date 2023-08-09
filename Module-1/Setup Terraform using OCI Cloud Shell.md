# Provider Configuration Guide for Oracle Cloud Infrastructure (OCI)

This guide will walk you through the process of identifying all the required parameters for the `provider.tf` file when using the Oracle Cloud Infrastructure (OCI) provider in your Terraform configuration.

## Step 1: Tenancy OCID

Follow these steps to obtain your Tenancy OCID from the Oracle Cloud Infrastructure (OCI) Console:

1. Log in to your OCI Cloud Console.
2. In the upper right corner of the console, click on your profile picture or initials to open the Profile menu.
3. From the Profile menu, select "Tenancy: \<your_tenancy_name\>".
4. Under "Tenancy Information", you will find the Tenancy OCID. Click the "Copy" button next to the OCID to copy it to your clipboard.
5. Replace `"ocid1.tenancy.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx2hna"` in the provider configuration with the copied Tenancy OCID.

## Step 2: User OCID

Retrieve the User OCID from the Oracle Cloud Infrastructure (OCI) Console using the following steps:

1. Log in to your OCI Cloud Console.
2. In the upper right corner of the console, click on your profile picture or initials to open the Profile menu.
3. From the Profile menu, select "My Profile".
4. Under "User Information", you will find the User OCID. Click the "Copy" button next to the OCID to copy it to your clipboard.
5. Replace `"ocid1.user.oc1..aaaaaaaavxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxca"` in the provider configuration with the copied User OCID.

## Step 3: Generate API Key Pair

### Using OCI Cloud Console:

1. In the OCI Cloud Console, go to "Identity" > "Users."
2. Select the user for whom you want to generate an API key pair.
3. Under the "API Keys" tab, click "Add API Key."
4. Download the generated API private key and keep it secure.

### Using OCI Cloud Shell (Optional):

To generate the required API key pair for Oracle Cloud Infrastructure (OCI) using OCI Cloud Shell, follow these OpenSSL commands in the required PEM format:

1. Open OCI Cloud Shell.
2. Create a directory named `.oci` to store the credentials:
   ```bash
   mkdir ~/.oci
   ```
3. Generate the private key with one of the following commands:
   - To generate the key encrypted with a passphrase you provide when prompted (recommended):
     ```bash
     openssl genrsa -out ~/.oci/oci_api_key.pem -aes128 2048
     ```
   - To generate the key with no passphrase:
     ```bash
     openssl genrsa -out ~/.oci/oci_api_key.pem 2048
     ```
   Choose the appropriate command based on your security preferences.
4. Set the file permissions to ensure that only you can read the private key file:
   ```bash
   chmod go-rwx ~/.oci/oci_api_key.pem
   ```
5. Generate the public key from the new private key:
   ```bash
   openssl rsa -pubout -in ~/.oci/oci_api_key.pem -out ~/.oci/oci_api_key_public.pem
   ```
6. Copy the contents of the public key to the clipboard using a tool like `pbcopy` (macOS) or `xclip` (Linux). You will need to paste this public key value into the OCI Console later. For example:
   ```bash
   cat ~/.oci/oci_api_key_public.pem | xclip
   ```
   Keep the public key value for the next steps.

## Upload the Public Key

Once you have generated the public key, follow these steps to upload it to the Oracle Cloud Infrastructure (OCI) Console:

1. Sign in to your OCI account.
2. View the details for the user who will be using the API key pair:
   - If you're signed in as the user:
     - Open the Profile menu, located in the upper-right corner of the OCI Console.
     - Click on "My Profile".
3. In the Resources section located at the bottom left, click on "API Keys".
4. Click the "Add API Key" button at the top left of the API Keys list. This will open the "Add API Key" dialog.
5. Select the "Paste a public key" radio button.
6. Paste the contents of the PEM public key you generated earlier into the dialog box.
7. Click the "Add" button.

By following these steps, you will successfully create and upload the public key to your profile, allowing your API requests to be securely signed and verified by OCI using the associated private key.

## Step 4: Fingerprint

1. In the Resources section located at the bottom left, click on "API Keys".
2. Choose the API key for which you want to obtain the fingerprint.
3. Copy the fingerprint value displayed for the selected API key.
4. Replace `"34:70:fc:XX2:54:2b:f8:58:6f:xx:xx:xx:de:xx:xx:ca"` in the provider configuration with the copied fingerprint.

## Step 5: Region

1. Determine the OCI region you want to use.
2. Replace `"us-phoenix-1"` in the provider configuration with your desired OCI region.

## Final Provider Configuration

```hcl
provider "oci" {
  tenancy_ocid     = "YOUR_TENANCY_OCID"
  user_ocid        = "YOUR_USER_OCID"
  fingerprint      = "YOUR_API_KEY_FINGERPRINT"
  private_key_path = "/home/sample/.oci/id_user.pem"
  region           = "YOUR_DESIRED_REGION"
}
```

Replace the placeholders (`YOUR_TENANCY_OCID`, `YOUR_USER_OCID`, `YOUR_API_KEY_FINGERPRINT`, and `YOUR_DESIRED_REGION`) with the corresponding values you obtained from the OCI Cloud Console.

Remember to store your private key securely and never share it.
