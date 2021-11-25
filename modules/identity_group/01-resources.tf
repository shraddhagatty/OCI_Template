############################################################################
# Module Definition:
############################################################################
# Group:

resource "oci_identity_group" "group" {
  compartment_id = var.tenancy_ocid
  description    = var.group_desc
  name           = var.group_name
  defined_tags   = var.defined_tags
  
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
# Policy:

resource "oci_identity_policy" "policy" {
  compartment_id = var.tenancy_ocid
  description    = var.policy_desc
  name           = var.policy_name
  statements     = var.policy_statements
  defined_tags   = var.defined_tags
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
