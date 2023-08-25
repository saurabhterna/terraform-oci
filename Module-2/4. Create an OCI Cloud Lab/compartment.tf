resource "random_integer" "cm-id" {
  min = 10
  max = 99
}

resource "oci_identity_compartment" "ocilab-compartment" {
    # Required
    compartment_id = var.compartment_id	
    description = "Compartment for Terraform resources."
    name = "OCILAB-CM-${random_integer.cm-id.result}"
    enable_delete = true
}

resource "oci_identity_user" "ocilab-user" {
    compartment_id = var.compartment_id
    description = "OCI LAB User"
    name = "OCILAB-USER-${random_integer.cm-id.result}"
}

resource "oci_identity_group" "ocilab-group" {    
    compartment_id = var.compartment_id
    description = "Terraform Group"
    name = "OCILAB-GRP-${random_integer.cm-id.result}"
}

resource "oci_identity_user_group_membership" "ocilab_user_group_membership" {
    group_id = oci_identity_group.ocilab-group.id
    user_id = oci_identity_user.ocilab-user.id
}

resource "oci_identity_ui_password" "ocilab-password" {
	user_id = oci_identity_user.ocilab-user.id
}
