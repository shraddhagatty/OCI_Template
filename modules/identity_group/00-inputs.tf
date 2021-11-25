############################################################################
# Module Input Variables:
############################################################################

variable "tenancy_ocid" {
}

variable "group_desc" {
  default = ""
}

variable "group_name" {
}

variable "policy_desc" {
  default = ""
}

variable "policy_name" {
}

variable "policy_statements" {
  type = list(string)
}

variable "user_ocid" {
}

variable "fingerprint" {
}

variable "private_key_path" {
}

variable "defined_tags" {
    type = map(string)
}

############################################################################
