provider "oci" {
  tenancy_ocid   = "ocid1.tenancy.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx2hna"
  user_ocid      = "ocid1.user.oc1..aaaaaaaavxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxca"
  fingerprint      = "34:70:fc:XX2:54:2b:f8:58:6f:xx:xx:xx:de:xx:xx:ca"
  private_key_path = "/home/sample/.oci/id_user.pem" # Replace with your directory location stored .pem file
  region           = "us-phoenix-1" # Replace with your desired region
}
