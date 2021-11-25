############################################################################
# Module Input Variables:
############################################################################

variable "cidr_block" {
}

variable "compartment_id" {
}

variable "vcn_id" {
}

variable "subnet_display_name" {
}

variable "subnet_dns_label" {
}

variable "route_table_id" {
}

variable "prohibit_public_ip" {
  default = false
}

variable "availability_domain" {
  default = ""
}

variable "dhcp_options_id" {
  default = ""
}

variable "security_list_ids" {
  type    = list(string)
  default = []
}

variable "defined_tags" {
    type = map(string)
}

############################################################################
