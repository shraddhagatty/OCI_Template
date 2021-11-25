############################################################################
# Module Definition:
############################################################################
# Network Security Rule:

# ICMP:
resource "oci_core_network_security_group_security_rule" "network_security_group_security_rule_ingress_icmp" {
  count                     = var.create_icmp ? 1 : 0
  network_security_group_id = var.net_sec_group_id
  direction                 = "INGRESS"
  protocol                  = "1"
  description               = var.net_sec_group_desc
  source                    = var.net_sec_group_source
  source_type               = var.net_sec_group_source_type
  icmp_options {
    type = var.icmp_type
    code = var.icmp_code
  }
}

# TCP:
resource "oci_core_network_security_group_security_rule" "network_security_group_security_rule_ingress_tcp" {
  count                     = var.create_tcp ? 1 : 0
  network_security_group_id = var.net_sec_group_id
  direction                 = "INGRESS"
  protocol                  = "6"
  description               = var.net_sec_group_desc
  source                    = var.net_sec_group_source
  source_type               = var.net_sec_group_source_type
  tcp_options {
    destination_port_range {
      min = var.net_sec_group_tcp_min
      max = var.net_sec_group_tcp_max
    }
  }
}

# UDP:
resource "oci_core_network_security_group_security_rule" "network_security_group_security_rule_ingress_udp" {
  count                     = var.create_udp ? 1 : 0
  network_security_group_id = var.net_sec_group_id
  direction                 = "INGRESS"
  protocol                  = "17"
  description               = var.net_sec_group_desc
  source                    = var.net_sec_group_source
  source_type               = var.net_sec_group_source_type
  udp_options {
    destination_port_range {
      min = var.net_sec_group_udp_min
      max = var.net_sec_group_udp_max
    }
  }
}

############################################################################
