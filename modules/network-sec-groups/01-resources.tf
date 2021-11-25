############################################################################
# Module Definition:
############################################################################
# Network Security Group:

resource "oci_core_network_security_group" "network_security_group" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = var.network_sec_group_display_name
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
# Network Security Rules - Defaults:

# Egress - All:
resource "oci_core_network_security_group_security_rule" "network_security_group_security_rule_egress1" {
  count                     = var.create_defaults ? 1 : 0
  network_security_group_id = oci_core_network_security_group.network_security_group.id
  direction                 = "EGRESS"
  protocol                  = "all"
  description               = var.desc_egress_all
  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
}

# Ingress - Ping - Version 1:
resource "oci_core_network_security_group_security_rule" "network_security_group_security_rule_ingress1" {
  count                     = var.create_defaults ? 1 : 0
  network_security_group_id = oci_core_network_security_group.network_security_group.id
  direction                 = "INGRESS"
  protocol                  = "1"
  description               = var.desc_ingress_ping_v1
  source                    = var.ip_version1
  source_type               = "CIDR_BLOCK"
  icmp_options {
    type = 8
    code = 0
  }
}

# Ingress - Ping - On-Premise:
resource "oci_core_network_security_group_security_rule" "network_security_group_security_rule_ingress2" {
  count                     = var.create_defaults ? 1 : 0
  network_security_group_id = oci_core_network_security_group.network_security_group.id
  direction                 = "INGRESS"
  protocol                  = "1"
  description               = var.desc_ingress_ping_onprem
  source                    = var.ip_onprem_primary
  source_type               = "CIDR_BLOCK"
  icmp_options {
    type = 8
    code = 0
  }
}

# Ingress - SSH - On-Premise:
resource "oci_core_network_security_group_security_rule" "network_security_group_security_rule_ingress3" {
  count                     = var.create_defaults ? 1 : 0
  network_security_group_id = oci_core_network_security_group.network_security_group.id
  direction                 = "INGRESS"
  protocol                  = "6"
  description               = var.desc_ingress_ssh_onprem
  source                    = var.ip_onprem_primary
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = "22"
      min = "22"
    }
  }
}

############################################################################
