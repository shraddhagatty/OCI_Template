############################################################################
# Network Security Groups - nonprod_app_ext:
############################################################################

module "security_group_nonprod_app_ext" {
    source                         = "./modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "nonprod_app_ext"
    defined_tags                   = local.tags_common
}
 
output "security_group_nonprod_app_ext_id" {
    value                         = module.security_group_nonprod_app_ext.group_id
}

############################################################################
# EGRESS:

module "nonprod_app_ext_egress_all" {
    source                 = "./modules/network-sec-rules"
    net_sec_group_id       = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_desc      = "nonprod_app_ext_egress_all"
    net_sec_rule_dest      = "0.0.0.0/0"
    net_sec_rule_dest_type = "CIDR_BLOCK"
    create_egress_all      = true
}

module "nonprod_app_ext_egress_nprd_db_sql" {
    source                 = "./modules/network-sec-rules"
    net_sec_group_id       = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_desc      = "nonprod_app_ext_egress_nprd_db_sql"
    net_sec_rule_dest      = module.security_group_nonprod_db.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_tcp      = true
    net_sec_rule_tcp_min   = "1521"
    net_sec_rule_tcp_max   = "1525"
}

module "nonprod_app_ext_egress_nprd_app_http1" {
    source                 = "./modules/network-sec-rules"
    net_sec_group_id       = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_desc      = "nonprod_app_ext_egress_nprd_app_http1"
    net_sec_rule_dest      = module.security_group_nonprod_app.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_tcp      = true
    net_sec_rule_tcp_min   = "7005"
    net_sec_rule_tcp_max   = "7009"
}

module "nonprod_app_ext_egress_nprd_app_http2" {
    source                 = "./modules/network-sec-rules"
    net_sec_group_id       = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_desc      = "nonprod_app_ext_egress_nprd_app_http2"
    net_sec_rule_dest      = module.security_group_nonprod_app.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_tcp      = true
    net_sec_rule_tcp_min   = "5560"
    net_sec_rule_tcp_max   = "5564"
}

############################################################################
# INGRESS:

module "nonprod_app_ext_ingress_nprd_lb_ext_http" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_desc        = "nonprod_app_ext_ingress_nprd_lb_ext_http"
    net_sec_rule_source      = module.security_group_nonprod_lb_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "8000"
    net_sec_rule_tcp_max     = "8005"
}

 

module "nonprod_app_ext_ingress_nprd_app_ssh" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_desc        = "nonprod_app_ext_ingress_nprd_app_ssh"
    net_sec_rule_source      = module.security_group_nonprod_app.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "22"
    net_sec_rule_tcp_max     = "22"
}

module "nonprod_app_ext_ingress_nprd_app_http3" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_desc        = "nonprod_app_ext_ingress_nprd_app_http3"
    net_sec_rule_source      = module.security_group_nonprod_app.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "12349"
    net_sec_rule_tcp_max     = "12349"
}

############################################################################
