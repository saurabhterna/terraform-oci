output "instance_public_ips" {
  value = [for instance in oci_core_instance.TFDemoInstance : instance.public_ip]
}

output "loadbalancer_public_url" {
  value = "http://${oci_load_balancer.HA_LB.ip_addresses[0]}"
}
