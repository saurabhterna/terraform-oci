

variable "ssh_public_key" {}

variable "ssh_private_key" {}

variable "instance_shape" {
  default = "VM.Standard2.1"
}

variable "instance_ocpus" {
  default = 1
}

variable "instance_image_ocid" {
    default = "ocid1.image.oc1.phx.aaaaaaaa3imx2f53jbfwtl6akamfxbl2kkke74jbrek2hk5xgjvcgrw6v6fa" #Oracle-Linux-8.5-2022.02.25-0
}

variable "db_size" {
  default = "50" # size in GBs
}

variable "instance_count" {
  default = 2
}


resource "oci_core_instance" "TFDemoInstance" {
  count = var.instance_count
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = var.compartment_id
  display_name        = "TFDemoInstance${count.index + 1}"
  shape               = var.instance_shape
shape_config {
    ocpus = var.instance_ocpus
  }
  create_vnic_details {
    subnet_id        = oci_core_subnet.public_subnet.id
    display_name     = "Primaryvnic"
    assign_public_ip = true
    hostname_label   = "TFDemo${count.index + 1}"
  }
   source_details {
    source_type = "image"
    source_id   = var.instance_image_ocid
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    //user_data           = "${base64encode(file("./userdata/bootstrap"))}"
  }
  timeouts {
    create = "60m"
  }
}

resource "null_resource" "remote-exec" {
  count = var.instance_count
  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "30m"
      host        = oci_core_instance.TFDemoInstance[count.index].public_ip
      user        = "opc"
      private_key = var.ssh_private_key
    }

    inline = [
        "echo 'This instance was provisioned by Terraform.' | sudo tee /etc/motd",
        "sudo yum -y install httpd",
        "echo 'This is index page${count.index + 1}' | sudo tee -a /var/www/html/index.html",
        "sudo firewall-cmd --permanent --add-service=http",
        "sudo firewall-cmd --reload",
        "sudo systemctl start httpd",
       "sudo systemctl enable httpd"
    ]
  }

}
