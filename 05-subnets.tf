############################################################################
# Subnets:
############################################################################
# Production Red Tier:

module "subnet_ext_prod" {
  source              = "./modules/subnet"
  subnet_display_name = "Prod External Subnet"
  subnet_dns_label    = "prodext"
  cidr_block          = var.ip_subnet_ext_prod
  compartment_id      = module.compartment-common-services.compartment_id
  prohibit_public_ip  = false
  vcn_id              = module.vcn.vcn_id
  route_table_id      = module.route_table_prod_ext.route_table_id
  defined_tags        = local.tags_common
  #security_list_ids   = [oci_core_security_list.security_list_default_empty.id]
}

output "subnet_ext_prod_id" {
  value = module.subnet_ext_prod.subnet_id
}

############################################################################
# DMZ Production Red Tier:

module "subnet_dmz_prod" {
  source              = "./modules/subnet"
  subnet_display_name = "Prod DMZ Subnet"
  subnet_dns_label    = "proddmz"
  cidr_block          = var.ip_subnet_dmz_prod
  compartment_id      = module.compartment-common-services.compartment_id
  prohibit_public_ip  = false
  vcn_id              = module.vcn.vcn_id
  route_table_id      = module.route_table_prod_ext.route_table_id
  defined_tags        = local.tags_common
  #security_list_ids   = [oci_core_security_list.security_list_default_empty.id]
}

output "subnet_dmz_prod_id" {
  value = module.subnet_dmz_prod.subnet_id
}

############################################################################
# Production Amber Tier:

module "subnet_app_prod" {
  source              = "./modules/subnet"
  subnet_display_name = "Prod Application Subnet"
  subnet_dns_label    = "prodapp"
  cidr_block          = var.ip_subnet_app_prod
  compartment_id      = module.compartment-common-services.compartment_id
  prohibit_public_ip  = true
  vcn_id              = module.vcn.vcn_id
  route_table_id      = module.route_table_prod_app.route_table_id
  defined_tags        = local.tags_common
  #security_list_ids   = [oci_core_security_list.security_list_default_empty.id]
}

output "subnet_app_prod_id" {
  value = module.subnet_app_prod.subnet_id
}

############################################################################
# Production Green Tier:

module "subnet_db_prod" {
  source              = "./modules/subnet"
  subnet_display_name = "Prod Database Subnet"
  subnet_dns_label    = "proddb"
  cidr_block          = var.ip_subnet_db_prod
  compartment_id      = module.compartment-common-services.compartment_id
  prohibit_public_ip  = true
  vcn_id              = module.vcn.vcn_id
  route_table_id      = module.route_table_prod_db.route_table_id
  defined_tags        = local.tags_common
  #security_list_ids   = [oci_core_security_list.security_list_default_empty.id]
}

output "subnet_db_prod_id" {
  value = module.subnet_db_prod.subnet_id
}

############################################################################
# NonProd DMZ Tier:

module "subnet_dmz_nonprod" {
  source              = "./modules/subnet"
  subnet_display_name = "NonProd DMZ Subnet"
  subnet_dns_label    = "nonproddmz"
  cidr_block          = var.ip_subnet_dmz_nonprod
  compartment_id      = module.compartment-common-services.compartment_id
  prohibit_public_ip  = false
  vcn_id              = module.vcn.vcn_id
  route_table_id      = module.route_table_nonprod_ext.route_table_id
  defined_tags        = local.tags_common
  #security_list_ids   = [oci_core_security_list.security_list_default_empty.id]
}

output "subnet_dmz_nonprod_id" {
  value = module.subnet_dmz_nonprod.subnet_id
}

############################################################################
# NonProd External App Tier:

module "subnet_ext_nonprod" {
  source              = "./modules/subnet"
  subnet_display_name = "NonProd External Application Subnet"
  subnet_dns_label    = "nonprodext"
  cidr_block          = var.ip_subnet_ext_nonprod
  compartment_id      = module.compartment-common-services.compartment_id
  prohibit_public_ip  = true
  vcn_id              = module.vcn.vcn_id
  route_table_id      = module.route_table_nonprod_app.route_table_id
  defined_tags        = local.tags_common
  #security_list_ids   = [oci_core_security_list.security_list_default_empty.id]
}

output "subnet_ext_nonprod_id" {
  value = module.subnet_ext_nonprod.subnet_id
}

############################################################################
# NonProd Internal App Tier:

module "subnet_app_nonprod" {
  source              = "./modules/subnet"
  subnet_display_name = "NonProd Internal Application Subnet"
  subnet_dns_label    = "nonprodapp"
  cidr_block          = var.ip_subnet_app_nonprod
  compartment_id      = module.compartment-common-services.compartment_id
  prohibit_public_ip  = true
  vcn_id              = module.vcn.vcn_id
  route_table_id      = module.route_table_nonprod_app.route_table_id
  defined_tags        = local.tags_common
  #security_list_ids   = [oci_core_security_list.security_list_default_empty.id]
}

output "subnet_app_nonprod_id" {
  value = module.subnet_app_nonprod.subnet_id
}

############################################################################
# NonProd DB Tier:

module "subnet_db_nonprod" {
  source              = "./modules/subnet"
  subnet_display_name = "NonProd Database Subnet"
  subnet_dns_label    = "nonproddb"
  cidr_block          = var.ip_subnet_db_nonprod
  compartment_id      = module.compartment-common-services.compartment_id
  prohibit_public_ip  = true
  vcn_id              = module.vcn.vcn_id
  route_table_id      = module.route_table_nonprod_db.route_table_id
  defined_tags        = local.tags_common
  #security_list_ids   = [oci_core_security_list.security_list_default_empty.id]
}

output "subnet_db_nonprod_id" {
  value = module.subnet_db_nonprod.subnet_id
}

############################################################################
