############################################################################
# Module Input Variables:
############################################################################

variable "compartment_id" {
}

variable "vcn_id" {
}

variable "network_sec_group_display_name" {
}

variable "ip_version1" {
  default = ""
}

variable "ip_onprem_primary" {
  default = ""
}

variable "create_defaults" {
  default = false
}

variable "defined_tags" {
    type = map(string)
}

variable "desc_egress_all" {
  default = "Egress - All"
}

variable "desc_ingress_ping_v1" {
  default = "Ingress - Ping - Version 1"
}

variable "desc_ingress_ping_onprem" {
  default = "Ingress - Ping - On-Premise Primary"
}

variable "desc_ingress_ssh_onprem" {
  default = "Ingress - SSH - On-Premise Primary"
}

############################################################################
