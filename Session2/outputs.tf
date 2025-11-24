output "my_group_id" {
    value = data.akamai_group.my_group_id
}

output "my_appsec_configuration" {
    value = data.akamai_appsec_configuration.my_appsec_configuration
}

output "KD_terraform_property" {
  value = akamai_property.KD_terraform_property
}

output "my_security_policy_1" {
  value = akamai_appsec_security_policy.my_terraform_sec_policy_1
}

