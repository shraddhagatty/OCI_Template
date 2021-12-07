############################################################################
# Network Security Groups - prod_lb:
############################################################################
module "security_group_prod_lb" {
    source                         = "./modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "prod_lb"
    defined_tags                   = local.tags_common
}
 
output "security_group_prod_lb_id" {
    value                         = module.security_group_prod_lb.group_id
}
 


module "prod_lb_ingress_tcp_d" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb.group_id
    net_sec_rule_desc    = "http disco"
    net_sec_rule_source = "0.0.0.0/0"
    net_sec_rule_source_type = "CIDR_BLOCK"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "80"
    net_sec_rule_tcp_max = "80"
}

module "prod_lb_ingress_tcp_3" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb.group_id
    net_sec_rule_desc    = "Frontend test access"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "443"
    net_sec_rule_tcp_max = "443"
}

module "prod_lb_egress_all" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_lb.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_dest = module.security_group_prod_app.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_all            = true
}

############################################################################
