############################################################################
# Module Input Variables:
############################################################################

# Route Table
variable "compartment_id" {
}

variable "vcn_id" {
}

variable "route_rules" {
  type = list(map(string))
}

variable "display_name" {
}

variable "defined_tags" {
    type = map(string)
}

############################################################################
