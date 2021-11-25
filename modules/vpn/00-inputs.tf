############################################################################
# Module Input Variables:
############################################################################

variable "compartment_id" {
}

variable "cpe_ip_address" {
}

variable "cpe_display_name" {
}

variable "ipsec_drg_id" {
}

variable "ipsec_static_routes" {
  type = list(string)
}

variable "ipsec_display_name" {
}

variable "defined_tags" {
    type = map(string)
}

############################################################################
