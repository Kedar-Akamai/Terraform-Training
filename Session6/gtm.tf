data "akamai_gtm_domain" "my_domain" {
  name = "kedar99.akadns.net"
}



resource "akamai_gtm_domain" "my_domain" {
  contract                = var.my_contract
  group                   = data.akamai_group.my_group_id.id
  name                    = "kedar99.akadns.net"
  type                    = "basic"
  email_notification_list = ["kdoddama@akamai.com"]
  load_imbalance_percentage = 10
}


#Import command used: terraform import akamai_gtm_domain.my_domain kedar99.akadns.net 