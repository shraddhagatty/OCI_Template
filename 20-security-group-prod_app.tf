############################################################################
# Network Security Groups - prod_app:
############################################################################

module "security_group_prod_app" {
    source                         = "./modules/network-sec-groups"
    compartment_id                 = module.compartment-common-services.compartment_id
    vcn_id                         = module.vcn.vcn_id
    network_sec_group_display_name = "prod_app"
    defined_tags                   = local.tags_common
}
 
output "security_group_prod_app_id" {
    value                         = module.security_group_prod_app.group_id
}
 
 
# ingress tcp :
module "prod_app_ingress_tcp_2" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app.group_id
    net_sec_rule_desc    = "LB access"
    net_sec_rule_source = module.security_group_prod_lb.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8002"
    net_sec_rule_tcp_max = "8002"
}
 
module "prod_app_ingress_tcp_3" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_prod_access.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8002"
    net_sec_rule_tcp_max = "8002"
}

module "prod_app_ingress_tcp_db" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_prod_db.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8002"
    net_sec_rule_tcp_max = "8002"
}

module "prod_app_ingress_tcp_4" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app.group_id
    net_sec_rule_desc    = ""
    net_sec_rule_source = module.security_group_prod_access.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "7000"
    net_sec_rule_tcp_max = "7005"
}

# prod_app_ingress_sftp_prod_leb-ext:
module "prod_app_ingress_tcp_22" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app.group_id
    net_sec_rule_desc    = "LB access"
    net_sec_rule_source = module.security_group_prod_lb_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "22"
    net_sec_rule_tcp_max = "22"
}

# prod_app_ingress_smt_from_db:
module "prod_app_ingress_tcp_25" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app.group_id
    net_sec_rule_desc    = "smtp access"
    net_sec_rule_source = module.security_group_prod_common.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "25"
    net_sec_rule_tcp_max = "25"
}



module "prod_app_ingress_http_BACS" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app.group_id
    net_sec_rule_desc    = "BACS 4443 access"
    net_sec_rule_source  = module.security_group_prod_lb_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "8002"
    net_sec_rule_tcp_max = "8002"
}

resource "oci_core_network_security_group_security_rule" "prod_app_ingress_ping_test" {
    network_security_group_id = module.security_group_prod_app.group_id
    direction                 = "INGRESS"
    protocol                  = "1"
    description               = "test ping"
    source                    = "10.148.178.128/25"
    source_type               = "CIDR_BLOCK"
    stateless                 = false
    icmp_options {
        type = 8
        code = 0
    }
} 

module "prod_app_ingress_prod_app_ext_http3" {
    source                   = "./modules/network-sec-rules"
    net_sec_group_id         = module.security_group_prod_app.group_id
    net_sec_rule_desc        = "prod_app_ingress_prod_app_ext_http3"
    net_sec_rule_source      = module.security_group_prod_app_ext.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp       = true
    net_sec_rule_tcp_min     = "12349"
    net_sec_rule_tcp_max     = "12349"
}

module "prod_app_ingress_ssh_nonprod_app" {
    source                = "./modules/network-sec-rules"
    net_sec_group_id      = module.security_group_prod_app.group_id
    net_sec_rule_desc    = "prod_app_ingress_ssh_nonprod_app"
    net_sec_rule_source = module.security_group_nonprod_app.group_id
    net_sec_rule_source_type = "NETWORK_SECURITY_GROUP"
    create_ingress_tcp            = true
    net_sec_rule_tcp_min = "22"
    net_sec_rule_tcp_max = "22"
}