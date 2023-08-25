resource "oci_limits_quota" "test_quota" {
	#Required
	compartment_id = var.tenancy_ocid
	description = "Quota Policy set for OCI Lab User"
	name = "Quota-Policy-for-${oci_identity_compartment.ocilab-compartment.name}"
	statements = [
              "Zero compute-core quotas in compartment ${oci_identity_compartment.ocilab-compartment.name}", 
              "Zero compute-memory quotas in compartment ${oci_identity_compartment.ocilab-compartment.name}",
              "Zero compute quotas in compartment ${oci_identity_compartment.ocilab-compartment.name}",
              "Zero compute-management quotas in compartment ${oci_identity_compartment.ocilab-compartment.name}",
              "Zero auto-scaling quotas in compartment ${oci_identity_compartment.ocilab-compartment.name}", 
              "Set compute-core quota standard-a1-core-count to 2 in compartment ${oci_identity_compartment.ocilab-compartment.name}",
              "Set compute-core quota standard-a1-core-regional-count to 2 in compartment ${oci_identity_compartment.ocilab-compartment.name}", 
              "Set compute-memory quota standard-a1-memory-count to 8 in compartment ${oci_identity_compartment.ocilab-compartment.name}",
              "Set compute-memory quota standard-a1-memory-regional-count to 8 in compartment ${oci_identity_compartment.ocilab-compartment.name}",
              "Set vcn quota vcn-count to 2 in compartment ${oci_identity_compartment.ocilab-compartment.name}"
    ]
}