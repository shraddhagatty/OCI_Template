############################################################################
# Network Security Groups - prod_lb_ext:
############################################################################
module "security_group_prod_lb_ext" {
    source                         = "./modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "prod_lb_ext"
    defined_tags                   = local.tags_common
}
 
output "security_group_prod_lb_ext_id" {
    value                         = module.security_group_prod_lb_ext.group_id
}
 


module "prod_lb_ext_egress_all" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb_ext.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_dest = module.security_group_prod_app_ext.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_all            = true
}

module "prod_lb_ext_egress_all_int" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb_ext.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_dest = module.security_group_prod_app.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_all            = true
}

module "prod_lb_ext_egress_prod_db" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb_ext.group_id
    net_sec_rule_desc    = "prod_lb_ext_egress_prod_db"
    net_sec_rule_dest = module.security_group_prod_db.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_all            = true
}
