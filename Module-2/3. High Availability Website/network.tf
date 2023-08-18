

resource "oci_core_virtual_network" "phx_vcn01" {
  cidr_block     = "10.0.0.0/16"
  display_name  = "VCN-HA-LB"
  compartment_id = var.compartment_id
  dns_label = "VCNHALB"
}

resource "oci_core_internet_gateway" "my_igw" {
  display_name  = "VCN-HA-LB-IGW-01"
  vcn_id        = oci_core_virtual_network.phx_vcn01.id
  compartment_id = var.compartment_id
}

resource "oci_core_route_table" "public_rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.phx_vcn01.id
  display_name = "VCN-HA-LB-RT-01"
  route_rules {
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.my_igw.id
  }
}
resource "oci_core_security_list" "public_sl" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.phx_vcn01.id
  display_name  = "PHX-VCN-01-PublicSubnet-01-SecurityList-01"

  ingress_security_rules {
    source = "0.0.0.0/0"
    protocol = "6" # TCP
    stateless = false
    tcp_options {
      max = 443
      min = 443
    }
  }

  ingress_security_rules {
    source = "0.0.0.0/0"
    protocol = "6" # TCP
    stateless = false
    tcp_options {
      max = 80
      min = 80
    }
  }

    ingress_security_rules {
    source = "0.0.0.0/0"
    protocol = "6" # TCP
    stateless = false
    tcp_options {
      max = 22
      min = 22
    }
  }
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol = "all"
    stateless = false
  }
}


resource "oci_core_subnet" "public_subnet_1" {
  cidr_block     = "10.0.1.0/24"
  display_name  = "Compute-PublicSubnet-01"
  vcn_id        = oci_core_virtual_network.phx_vcn01.id
  compartment_id = var.compartment_id
  dns_label = "computepub"

  route_table_id = oci_core_route_table.public_rt.id
  security_list_ids = [oci_core_security_list.public_sl.id]
}

resource "oci_core_subnet" "public_subnet_2" {
  cidr_block     = "10.0.2.0/24"
  display_name  = "LB-PublicSubnet-01"
  vcn_id        = oci_core_virtual_network.phx_vcn01.id
  compartment_id = var.compartment_id
  dns_label = "lbpub"

  route_table_id = oci_core_route_table.public_rt.id
  security_list_ids = [oci_core_security_list.public_sl.id]
}
