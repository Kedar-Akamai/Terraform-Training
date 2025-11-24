data "akamai_group" "my_group_id" {
 group_name = "Advanced Technical Training – App & API Protection-V-3VC1HD6"
 contract_id = "V-3VC1HD6"
}


data "akamai_appsec_configuration" "my_appsec_configuration" {
    name = "KD_TerraformCohort_Config"
}

data  "akamai_property" "KD_terraform_property" {
    name = "KD_terraform_cohort"
}