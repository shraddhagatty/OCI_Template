############################################################################
# Module Definition:
############################################################################
# Subnet:

resource "oci_core_subnet" "subnet" {
  cidr_block                 = var.cidr_block
  compartment_id             = var.compartment_id
  vcn_id                     = var.vcn_id
  display_name               = var.subnet_display_name
  dns_label                  = var.subnet_dns_label
  route_table_id             = var.route_table_id
  prohibit_public_ip_on_vnic = var.prohibit_public_ip
  availability_domain        = var.availability_domain
  dhcp_options_id            = var.dhcp_options_id
  defined_tags               = var.defined_tags
  #security_list_ids          = var.security_list_ids
  lifecycle {
    ignore_changes = [
      defined_tags["Oracle-Tags.CreatedBy"],
      defined_tags["Oracle-Tags.CreatedOn"],
      defined_tags["Account.Created_By"],
      defined_tags["Account.Created_At"],
    ]
  }
}

############################################################################