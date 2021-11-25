############################################################################
# Module Definition:
############################################################################
# CPE:

resource "oci_core_cpe" "cpe" {
  compartment_id = var.compartment_id
  ip_address     = var.cpe_ip_address
  display_name   = var.cpe_display_name
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
# IPSec:

resource "oci_core_ipsec" "ip_sec_connection" {
  compartment_id = var.compartment_id
  cpe_id         = oci_core_cpe.cpe.id
  drg_id         = var.ipsec_drg_id
  static_routes  = var.ipsec_static_routes
  display_name   = var.ipsec_display_name
  #cpe_local_identifier      = "${var.ipsec_cpe_local_identifier}"
  #cpe_local_identifier_type = "${var.ipsec_cpe_local_identifier_type}"
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
