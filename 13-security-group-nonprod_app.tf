############################################################################
# Network Security Groups - nonprod_app:
############################################################################
module "security_group_nonprod_app" {
    source                         = "./modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "nonprod_app"
    defined_tags                   = local.tags_common
}
 
output "security_group_nonprod_app_id" {
    value                         = module.security_group_nonprod_app.group_id
}
 
############################################################################
# EGRESS:

module "nonprod_app_egress_nprd_app_ext_ssh" {
    source                 = "./modules/network-sec-rules"
    net_sec_group_id       = module.security_group_nonprod_app.group_id
    net_sec_rule_desc      = "nonprod_app_egress_nprd_app_ext_ssh"
    net_sec_rule_dest      = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_dest_type = "NETWORK_SECURITY_GROUP"
    create_egress_tcp      = true
    net_sec_rule_tcp_min   = "22"
    net_sec_rule_tcp_max   = "22"
}

############################################################################
# ingress tcp :
module "nonprod_app_ingress_tcp" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_nonprod_lb.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8000"
    net_sec_rule_tcp_max = "8009"
}

module "nonprod_app_ingress_tcp_db" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_nonprod_db.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8000"
    net_sec_rule_tcp_max = "8009"
}

module "nonprod_app_ingress_sftp_external" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_nonprod_lb_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "22"
    net_sec_rule_tcp_max = "22"
}
 

module "nonprod_app_ingress_tcp_22" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "LB SFTP access"
    net_sec_rule_source = module.security_group_nonprod_lb_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "22"
    net_sec_rule_tcp_max = "22"
}

# nonprod_app_ingress_smt_from_db:
module "nonprod_app_ingress_tcp_25" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "smtp access"
    net_sec_rule_source = module.security_group_nonprod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "25"
    net_sec_rule_tcp_max = "25"
}


module "nonprod_app_ingress_nprd_app_ext_http1" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = module.security_group_nonprod_app.group_id
    net_sec_rule_desc        = "nonprod_app_ingress_nprd_app_ext_http1"
    net_sec_rule_source      = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "7005"
    net_sec_rule_tcp_max     = "7009"
}

module "nonprod_app_ingress_nprd_app_ext_http2" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = module.security_group_nonprod_app.group_id
    net_sec_rule_desc        = "nonprod_app_ingress_nprd_app_ext_http2"
    net_sec_rule_source      = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "5560"
    net_sec_rule_tcp_max     = "5564"
}

module "nonprod_app_ingress_nprd_app_ext_http3" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = module.security_group_nonprod_app.group_id
    net_sec_rule_desc        = "nonprod_app_ingress_nprd_app_ext_http3"
    net_sec_rule_source      = module.security_group_nonprod_app_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "12349"
    net_sec_rule_tcp_max     = "12349"
}

module "nonprod_app_ingress_ssh_prod_app" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_nonprod_app.group_id
    net_sec_rule_desc    = "nonprod_app_ingress_ssh_prod_app"
    net_sec_rule_source = module.security_group_prod_app.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "22"
    net_sec_rule_tcp_max = "22"
}

############################################################################
