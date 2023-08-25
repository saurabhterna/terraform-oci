output "users_temp_credentials" {
  sensitive = false
  value     = "${formatlist("User: %v   Password: %v  ", oci_identity_user.ocilab-user.name, oci_identity_ui_password.ocilab-password.password)}"
  #value = "${join(" \n ",oci_identity_ui_password.user_pwd.*.password)}"
}

output "tenancy_link" {
  value = "https://https://cloud.oracle.com/?tenant=${data.oci_identity_tenancy.current_tenancy.name}"
}