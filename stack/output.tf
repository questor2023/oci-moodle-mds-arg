output "moodle_public_ip" {
  value = "http://${module.moodle.public_ip}"
}

output "moodle_db_user" {
  value = var.moodle_name
}

output "moodle_db_password" {
  value = var.moodle_password
  sensitive = true
}

output "mds_instance_ip" {
  value =  module.mds-instance.private_ip
}

output "ssh_private_key" {
  value = local.private_key_to_show
  sensitive = true
}
