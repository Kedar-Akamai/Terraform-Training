// default rule information
data "akamai_property_rules_builder" "my_default_rule" {
  rules_v2025_07_07 {
    name      = "default"
    is_secure = false
    comments  = <<-EOT
      The behaviors in the default rule apply to all requests for the property hostnames unless another rule overrides these settings.
    EOT
    behavior {
      origin {
        origin_type                   = "CUSTOMER"
        hostname                      = var.ab_test == "A" ? "origin-a.kedar.com" : "origin-b.kedar.com"
        forward_host_header           = "ORIGIN_HOSTNAME"
        cache_key_hostname            = "REQUEST_HOST_HEADER"
        compress                      = true
        enable_true_client_ip         = false
        http_port                     = 80
      }
    } 
    behavior {
      caching {
        behavior = "NO_STORE"
      }
    }

    behavior {
      cp_code {
        value {
          id   = "1922066"
          name = "KD-terraformcohort"
        }
      }
    }
  }
}

resource "akamai_edge_hostname" "the_ehn" {
  edge_hostname = "kedar96.terraform.com.edgesuite.net"
  product_id  = "prd_Fresca"
  contract_id = "1-1NC95D"
  group_id    = data.akamai_group.my_group_id.id
  ip_behavior = "IPV4"
}

resource "akamai_property" "KD_terraform_property" {
  name        = "KD_terraform_cohort_two"
  product_id  = "prd_Fresca"
  contract_id = "ctr_1-1NC95D"
  group_id    = "19293"
  rule_format   = "v2025-10-16"
  rules= data.akamai_property_rules_builder.my_default_rule.json
  hostnames {
    cname_from = "kedar96.terraform.com"
    cname_to   = "kedar96.terraform.com.edgesuite.net"
    cert_provisioning_type = "CPS_MANAGED"
  }
  dynamic "hostnames" {
        for_each = local.app_hostnames
        content {
            cname_from             = hostnames.value
            cname_to               = "kedar96.terraform.com.edgesuite.net"
            cert_provisioning_type = "DEFAULT"
        }
  }
}

resource "akamai_property_activation" "my_activation_1" {
     property_id                    = data.akamai_property.KD_terraform_property.id
     network                        = "STAGING"
     contact                        = ["kdoddama@akamai.com"]
     note                           = "hello"
     version                        = "1"
     auto_acknowledge_rule_warnings = true
     timeouts {
       default = "1h"
     }
     lifecycle {
      ignore_changes = [
        note
    ]
   }
}

resource "akamai_property_activation" "my_activation_2" {
     property_id                    = data.akamai_property.KD_terraform_property.id
     network                        = "PRODUCTION"
     contact                        = ["kdoddama@akamai.com"]
     note                           = local.notes
     version                        = "1"
     auto_acknowledge_rule_warnings = true
     timeouts {
       default = "1h"
     }
     lifecycle {
      ignore_changes = [
        note
    ]
  }
}