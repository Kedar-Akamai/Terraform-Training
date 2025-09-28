//Fetching the group id
data "akamai_group" "my_group_id" {
    group_name  = "Akamai Technologies - Assets-1-3CV382"
    contract_id = "1-3CV382"
}

output "my_group_id" {
    value = data.akamai_group.my_group_id
}

//Fetching the details of all the security configurations and config ids
data "akamai_appsec_configuration" "my_appsec_configurations" {

}

output "my_appsec_configuration" {
    value = data.akamai_appsec_configuration.my_appsec_configurations
}

//Fetching the hostnames and certificate statuses under a property using the property id 
data "akamai_property_hostnames" "my_property_hostnames" {
    group_id    = "grp_18385"
    contract_id = "1-3CV382"
    property_id = "prp_688860"
}

output "my_property_hostnames" {
    value = data.akamai_property_hostnames.my_property_hostnames
}

//Fetching the security policy details using the config id and policy id
data "akamai_appsec_aap_selected_hostnames" "my_aap_selected_hostnames" {
  config_id          = 26526
  security_policy_id = "apt_83037"
}

output "my_selected_hostnames" {
  value = data.akamai_appsec_aap_selected_hostnames.my_aap_selected_hostnames
}
