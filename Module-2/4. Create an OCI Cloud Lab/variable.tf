variable "compartment_id" {
  default = "ocid1.tenancy.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxa"
  description = "The OCID of the rootcompartment where resources will be created."
}

variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxa"
  description = "The OCID of the OCI Lab Tenancy."
}

data "oci_identity_tenancy" "current_tenancy" {
  tenancy_id = var.tenancy_ocid
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id	
}

variable "availability_domain_number" {
  default = 0
}

variable "availability_domain_name" {
  default = ""
}

locals {
availability_domain_name = var.availability_domain_name == "" ? lookup(data.oci_identity_availability_domains.ads.availability_domains[var.availability_domain_number], "name") : var.availability_domain_name
}
