############################################################################
# IP Address Management:
############################################################################
# Internal:

# VCN CIDR:
variable "ip_vcn" {
  default = ""
}

# Subnet - Prod External:
variable "ip_subnet_ext_prod" {
  default = ""
}

# Subnet - Prod Application:
variable "ip_subnet_app_prod" {
  default = ""
}

# Subnet - Prod Database:
variable "ip_subnet_db_prod" {
  default = ""
}

# Subnet - NonProd Application:
variable "ip_subnet_app_nonprod" {
  default = ""
}

# Subnet - NonProd Database:
variable "ip_subnet_db_nonprod" {
  default = ""
}

# Subnet - Prod DMZ:
variable "ip_subnet_dmz_prod" {
  default = ""
}

# Subnet - Nonprod DMZ:
variable "ip_subnet_dmz_nonprod" {
  default = ""
}

# Subnet - Nonprod External:
variable "ip_subnet_ext_nonprod" {
  default = ""
}

