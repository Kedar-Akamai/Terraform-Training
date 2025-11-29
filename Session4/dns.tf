resource "akamai_dns_record" "kedar_record_type_cname" {
  count      = length(local.app_hostnames)
  zone       = "kedarzone.com"
  name       = local.app_hostnames[count.index]
  recordtype = "CNAME"
  ttl        = 60
  target = ["kedar96.terraform.com"]    
}

output "dns_names" {
  value = akamai_dns_record.kedar_record_type_cname
}

resource "akamai_dns_record" "my_dns_records" {
  for_each = var.dns_records
 
  zone       = "kedarzone.com"
  recordtype = each.value.recordType
  ttl        = each.value.ttl
  target     = [each.value.target]
  name       = each.value.name
}