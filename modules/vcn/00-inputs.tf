############################################################################
# Module Input Variables:
############################################################################
# VCN:

variable "cidr_block" {
}

variable "compartment_id" {
}

variable "vcn_display_name" {
}

variable "vcn_dns_label" {
}

############################################################################
# IGW:

variable "create_igw" {
  default = false
}

variable "igw_enabled" {
  default = true
}

variable "igw_display_name" {
  default = ""
}

############################################################################
#NGW:

variable "create_ngw" {
  default = false
}

variable "nat_display_name" {
  default = ""
}

############################################################################
# DRG:

variable "create_drg" {
  default = false
}

variable "drg_display_name" {
  default = ""
}

variable "drg_attach_display_name" {
  default = ""
}

variable "drg_route_table_id" {
  default = ""
}

############################################################################
# SGW:

variable "create_sgw" {
  default = false
}

variable "sgw_display_name" {
  default = ""
}

variable "oci_core_services_id" {
  default = ""
}

############################################################################
# LPG:

variable "create_lpg" {
  default = false
}

variable "lpg_display_name" {
  default = ""
}

variable "lpg_peer_id" {
  default = ""
}

variable "lpg_route_table_id" {
  default = ""
}

############################################################################

variable "defined_tags" {
    type = map(string)
}