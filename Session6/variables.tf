variable "my_contract" {
  description = "my contract of terraform managed infrastructure "
  type        = string
  default = "ctr_1-1NC95D"
}


variable "config_section" {
  type        = string
  description = "This is the config section"
    default     = "kedar"
}

variable "edgerc_path" {
  type        = string
  description = "This is the edgerc path "
  default     = "~/.edgerc"
}

variable "ab_test" {
  type        = string
  description = "This is the test value "
  default     = "A"
}

variable "apps" {
  default = [ "www", "api", "blog", "shop", "cdn"]
}

variable "dns_records" {
  default = {
    "origin1" = {
      zone       = "kedarzone.com"
      recordType = "A"
      ttl        = 60
      target     = "172.233.190.92"
      name       = "origin-www.kedar98.terraform.com"
    },
    "origin2" = {
      zone       = "kedarzone.com"
      recordType = "A"
      ttl        = 100
      target     = "173.233.190.93"
      name       = "origin-api.kedar98.terraform.comm"
    },
    "origin3" = {
      zone       = "kedarzone.com"
      recordType = "A"
      ttl        = 600
      target     = "174.233.190.94"
      name       = "origin-blog.kedar98.terraform.com"
    }
  }
}
variable "akamai_client_secret" {}
variable "akamai_host" {}
variable "akamai_access_token" {}
variable "akamai_client_token" {}
variable "akamai_account_key" {}