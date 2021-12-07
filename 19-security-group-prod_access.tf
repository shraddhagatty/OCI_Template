############################################################################
# Network Security Groups - prod_access:
############################################################################
module "security_group_prod_access" {
    source                         = "./modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "prod_access"
    defined_tags                   = local.tags_common
}
 
output "security_group_prod_access_id" {
    value                         = module.security_group_prod_access.group_id
}
 
