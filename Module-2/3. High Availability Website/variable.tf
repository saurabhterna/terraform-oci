variable "compartment_id" {
  default = "ocid1.compartment.oc1..aaaaaaaawaaaaaaaaaaaaaaaaaaaaa3aaaaaaaa"
  description = "The OCID of the compartment where resources will be created."
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

