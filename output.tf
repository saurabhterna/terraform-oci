output "instance_public_ips" {
  value = [for instance in oci_core_instance.TFDemoInstance : instance.public_ip]
}
