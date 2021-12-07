############################################################################
# Network Security Groups - prod_lb_ext_waf:
############################################################################

module "security_group_prod_lb_ext_waf" {
    source                         = "./modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "prod_lb_ext_waf"
    defined_tags                   = local.tags_common
}
 
output "security_group_prod_lb_ext_waf_id" {
    value                         = module.security_group_prod_lb_ext_waf.group_id
}
 
############################################################################
