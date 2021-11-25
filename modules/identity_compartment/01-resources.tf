############################################################################
# Module Definition:
############################################################################
# Compartment:

resource "oci_identity_compartment" "compartment" {
  compartment_id = var.tenancy_ocid
  description    = var.compartment_description
  name           = var.compartment_name
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
