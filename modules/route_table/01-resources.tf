############################################################################
# Module Definition:
############################################################################

resource "oci_core_route_table" "route_table" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = var.display_name

  dynamic "route_rules" {
    for_each = var.route_rules
    content {
      cidr_block        = lookup(route_rules.value, "cidr_block", null)
      destination       = lookup(route_rules.value, "destination", null)
      destination_type  = lookup(route_rules.value, "destination_type", null)
      network_entity_id = route_rules.value.network_entity_id
    }
  }
  defined_tags = var.defined_tags
  lifecycle {
    ignore_changes = [
      defined_tags["Oracle-Tags.CreatedBy"],
      defined_tags["Oracle-Tags.CreatedOn"],
      defined_tags["Account.Created_By"],
      defined_tags["Account.Created_At"],
    ]
  }
}

##################################################################################
