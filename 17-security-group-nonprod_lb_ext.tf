############################################################################
# Network Security Groups - nonprod_lb_ext:
############################################################################

module "security_group_nonprod_lb_ext" {
    source                         = "./modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "nonprod_lb_ext"
    defined_tags                   = local.tags_common
}
 
output "security_group_nonprod_lb_ext_id" {
    value                         = module.security_group_nonprod_lb_ext.group_id
}

############################################################################
