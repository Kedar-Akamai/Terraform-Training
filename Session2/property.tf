resource "akamai_edge_hostname" "ehn" {
  product_id    = "prd_Fresca"
  contract_id = "V-3VC1HD6"
  group_id    = "201778"
  ip_behavior   = "IPV4"
  edge_hostname = "kedar98.terraform.com.edgesuite.net"
  ttl = 300
}

//Creating new property
resource "akamai_property" "KD_terraform_property" {
  name        = "KD_terraform_cohort"
  product_id  = "prd_Fresca"
  contract_id = "V-3VC1HD6"
  group_id    = "201778"
  hostnames {
    cname_from = "kedar98.terraform.com"
    cname_to   = "kedar98.terraform.com.edgesuite.net"
    cert_provisioning_type = "CPS_MANAGED"
  }
}