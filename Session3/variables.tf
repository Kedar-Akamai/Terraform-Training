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

variable "akamai_client_secret" {}
variable "akamai_host" {}
variable "akamai_access_token" {}
variable "akamai_client_token" {}
variable "akamai_account_key" {}