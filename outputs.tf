output "key_pair_name" {
  value = aws_key_pair.ocp4_installer_aws.id
  description = "The name of the key pair used for the OpenShift installation."
}
