############################################################################
# Module Input Variables:
############################################################################

variable "net_sec_group_id" {}

variable "net_sec_group_desc" {}

variable "net_sec_group_source" {}

variable "net_sec_group_source_type" {
    default = "CIDR_BLOCK"
}

variable "create_icmp" {
    default = false
}

variable "icmp_type" {
    default = 8
}

variable "icmp_code" {
    default = 0
}

variable "create_tcp" {
    default = false
}

variable "create_udp" {
    default = false
}

variable "net_sec_group_tcp_max" {
    default = ""
}

variable "net_sec_group_tcp_min" {
    default = ""
}

variable "net_sec_group_udp_max" {
    default = ""
}

variable "net_sec_group_udp_min" {
    default = ""
}

############################################################################
