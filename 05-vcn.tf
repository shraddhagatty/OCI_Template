############################################################################
# VCNs:
############################################################################

module "vcn" {
  source               = "./modules/vcn"
  vcn_display_name     = "${var.customer_label}-VCN"
  vcn_dns_label        = "${var.customer_label}ocivcn"
  cidr_block           = var.ip_vcn
  compartment_id       = module.compartment-common-services.compartment_id

  create_igw           = true
  igw_display_name     = "${var.customer_label}-IGW"

  create_ngw           = true
  nat_display_name     = "${var.customer_label}-NAT"

  create_drg           = true
  drg_display_name     = "${var.customer_label}-DRG"

  create_sgw           = true
  sgw_display_name     = "${var.customer_label}-SGW"
  oci_core_services_id = data.oci_core_services.core_services.services[0]["id"]

  defined_tags         = local.tags_common
}

############################################################################
