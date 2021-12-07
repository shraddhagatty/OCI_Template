############################################################################
# Network Security Groups - prod_app_ext:
############################################################################
module "security_group_prod_app_ext" {
    source                         = "./modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "prod_app_ext"
    defined_tags                   = local.tags_common
}
 
output "security_group_prod_app_ext_id" {
    value                         = module.security_group_prod_app_ext.group_id
}
 
 
# ingress tcp :
module "prod_app_ext_ingress_tcp_2" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app.group_id
    net_sec_rule_desc    = "LB access"
    net_sec_rule_source = module.security_group_prod_lb_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8002"
    net_sec_rule_tcp_max = "8002"
}
 


module "prod_app_ext_ingress_tcp_3" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app_ext.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_prod_access.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8002"
    net_sec_rule_tcp_max = "8002"
}

module "prod_app_ext_ingress_tcp_4" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app_ext.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_prod_access.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "7000"
    net_sec_rule_tcp_max = "7005"
}

module "prod_app_ext_ingress_prod_app_http3" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = module.security_group_prod_app_ext.group_id
    net_sec_rule_desc        = "prod_app_ext_ingress_prod_app_http3"
    net_sec_rule_source      = module.security_group_prod_app.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "12349"
    net_sec_rule_tcp_max     = "12349"
}

module "prod_app_ext_ingress_http_prod_lb_ext" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app_ext.group_id
    net_sec_rule_desc    = "prod_app_ext_ingress_http_prod_lb_ext"
    net_sec_rule_source = module.security_group_prod_lb_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8002"
    net_sec_rule_tcp_max = "8002"
}