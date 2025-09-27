data "akamai_group" "my_group_id" {
    group_name  = "WAAP Technical Mastery"
    contract_id = "V-3VC1HD6"
}

output "my_group_id" {
    value = data.akamai_group.my_group_id
}