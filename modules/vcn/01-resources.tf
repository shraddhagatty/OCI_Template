############################################################################
# Module Definition:
############################################################################
# VCN:

resource "oci_core_vcn" "vcn" {
  cidr_block     = var.cidr_block
  compartment_id = var.compartment_id
  display_name   = var.vcn_display_name
  dns_label      = var.vcn_dns_label
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
# IGW:

resource "oci_core_internet_gateway" "internet_gateway" {
  count = var.create_igw ? 1 : 0

  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  enabled        = var.igw_enabled
  display_name   = var.igw_display_name
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

#############################################################################
# NGW:

resource "oci_core_nat_gateway" "nat_gateway" {
  count = var.create_ngw ? 1 : 0

  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = var.nat_display_name
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

#############################################################################
# DRG:

resource "oci_core_drg" "drg" {
  count = var.create_drg ? 1 : 0

  compartment_id = var.compartment_id
  display_name   = var.drg_display_name
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

resource "oci_core_drg_attachment" "drg_attachment" {
  count = var.create_drg ? 1 : 0

  drg_id       = oci_core_drg.drg[0].id
  vcn_id       = oci_core_vcn.vcn.id
  display_name = var.drg_attach_display_name
  # route_table_id = "${var.drg_route_table_id}"
}

#############################################################################
# SGW:

resource "oci_core_service_gateway" "service_gateway" {
  count = var.create_sgw ? 1 : 0

  compartment_id = var.compartment_id
  services {
    service_id = var.oci_core_services_id # "${lookup(data.oci_core_services.core_services.services[0], "id")}"
  }
  vcn_id       = oci_core_vcn.vcn.id
  display_name = var.sgw_display_name
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

#############################################################################
# LPG:

resource "oci_core_local_peering_gateway" "local_peering_gateway" {
  count = var.create_lpg ? 1 : 0

  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = var.lpg_display_name
  # peer_id        = "${var.lpg_peer_id}"
  # route_table_id = "${var.lpg_route_table_id}"
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

#############################################################################
