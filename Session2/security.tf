resource "akamai_appsec_configuration" "my_terraform_appsec_configuration" {
 name        = "KD_TerraformCohort_Config"
 description = "This is my new configuration for Terraform Cohort."
 contract_id = "V-3VC1HD6"
 group_id    = "201778"
 host_names  = ["kdoddama.gslab-juiceshop.com"]
}

resource "akamai_appsec_security_policy" "my_terraform_sec_policy_1" {
  config_id              = akamai_appsec_configuration.my_terraform_appsec_configuration.id
  default_settings       = true
  security_policy_name   = "Terraformpolicy_1"
  security_policy_prefix = "trr1"
}

resource "akamai_appsec_security_policy" "my_terraform_sec_policy_2" {
  config_id              = akamai_appsec_configuration.my_terraform_appsec_configuration.id
  default_settings       = true
  security_policy_name   = "Terraformpolicy_2"
  security_policy_prefix = "trr2"
}
