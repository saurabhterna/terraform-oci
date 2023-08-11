provider "oci" {
  tenancy_ocid   = "ocid1.tenancy.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  user_ocid      = "ocid1.user.oc1..aaaaaaaavxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  fingerprint    = "35:69:fc:20:54:2b:xx:xx:6f:51:f7:XX:xx:xx:xx:xx"
  private_key_path = "~/.oci/id_rsa.pem"
  region         = "us-phoenix-1"
}
