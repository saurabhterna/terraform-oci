variable "lb_shape" {
  default = "flexible"
}


resource "oci_load_balancer" "HA_LB" {
  display_name   = "HA_LB"
  compartment_id = var.compartment_id
  shape = var.lb_shape

  shape_details {
    minimum_bandwidth_in_mbps = 10
    maximum_bandwidth_in_mbps = 100

  }
  subnet_ids     = [oci_core_subnet.public_subnet_2.id]

}

resource "oci_load_balancer_backend_set" "LB_backend_set" {
  load_balancer_id = oci_load_balancer.HA_LB.id
  name             = "LB_backend_set"
  policy           = "ROUND_ROBIN"

  health_checker {
    port                = "80"
    protocol            = "HTTP"
    response_body_regex = ".*"
    url_path            = "/"
    interval_ms         = "10000"
    return_code         = "200"
    timeout_in_millis   = "3000"
    retries             = "3"
  }
}

resource "oci_load_balancer_listener" "lb-listener1" {
  load_balancer_id         = oci_load_balancer.HA_LB.id
  name                     = "http"
  default_backend_set_name = oci_load_balancer_backend_set.LB_backend_set.name
  port                     = 80
  protocol                 = "HTTP"
}

resource "oci_load_balancer_backend" "example_backend" {
  count             = 2
  load_balancer_id  = oci_load_balancer.HA_LB.id
  backendset_name   = oci_load_balancer_backend_set.LB_backend_set.name
  ip_address        = oci_core_instance.TFDemoInstance[count.index].private_ip
  port              = 80
  backup            = false
  drain             = false
  offline           = false
  weight            = 1
}
