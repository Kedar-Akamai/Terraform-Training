provider "akamai" {
   edgerc         = var.edgerc_path
   config_section = var.config_section
}

variable "edgerc_path" {
   type        = string
   default     = "~/.edgerc"
   description = "Path to .edgerc file. Defaults to ~/.edgerc"
}

variable "config_section" {
   type        = string
   default     = "default"
   description = "EdgeRC section. Change this to switch between accounts, assuming your section has an account_id member"
}