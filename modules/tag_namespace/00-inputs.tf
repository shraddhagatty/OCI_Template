############################################################################
# Module Input Variables:
############################################################################
# Namespace:

variable "compartment_id" {}

variable "namespace_desc" {}

variable "namespace_name" {}

variable "is_retired" {
    default = false
}

############################################################################
# Tag:

variable "create_defaults_account" {
    default = false
}

variable "create_defaults_billing" {
    default = false
}

############################################################################
