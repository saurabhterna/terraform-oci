resource "oci_identity_policy" "test_policy" {

    depends_on = [oci_identity_compartment.ocilab-compartment, oci_identity_group.ocilab-group]

    #Required
    compartment_id = oci_identity_compartment.ocilab-compartment.id
    description = "Policies for OCI Lab"
    name = "Access-Policy-for-${oci_identity_user.ocilab-user.name}"
    statements = [
        "Allow group ${oci_identity_group.ocilab-group.name} to read all-resources in Compartment ${oci_identity_compartment.ocilab-compartment.name}",
        "Allow group ${oci_identity_group.ocilab-group.name} to manage virtual-network-family in Compartment ${oci_identity_compartment.ocilab-compartment.name}",
        "Allow group ${oci_identity_group.ocilab-group.name} to manage instance-family in compartment ${oci_identity_compartment.ocilab-compartment.name}",
        "Allow group ${oci_identity_group.ocilab-group.name} to read app-catalog-listing in compartment ${oci_identity_compartment.ocilab-compartment.name}",
        "Allow group ${oci_identity_group.ocilab-group.name} to use volume-family in compartment ${oci_identity_compartment.ocilab-compartment.name}",
    ]
}