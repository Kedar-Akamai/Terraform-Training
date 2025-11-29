data "akamai_group" "my_group_id" {
 group_name = "Akamai Professional Services-1-1NC95D"
 contract_id = "ctr_1-1NC95D"
}


/*data "akamai_appsec_configuration" "my_appsec_configuration" {
    name = "KD_TerraformCohort_Config"
}

data  "akamai_property" "KD_terraform_property" {
    name = "KD_terraform_cohort"
}

locals{
    notes = "${data.akamai_group.my_group_id.id}.{TF-3001}"
}

locals {
  app_hostnames = [for default in var.apps : "${default}.example.com"]
}


output "hostnames" {
    value = local.app_hostnames
}*/