############################################################################
# Compartments:
############################################################################
### Terraform configuration to provisions compartments in the tenancy.
# Common Services:

module "compartment-common-services" {
  source                  = "./modules/identity_compartment"
  tenancy_ocid            = var.tenancy_ocid
  compartment_description = "Common Services"
  compartment_name        = "common_services"
  defined_tags            = local.tags_common
}

output "common_services_compartment_id" {
  value = module.compartment-common-services.compartment_id
}

############################################################################
# Production Services:

module "compartment-prod-services" {
  source                  = "./modules/identity_compartment"
  tenancy_ocid            = var.tenancy_ocid
  compartment_description = "Production Services"
  compartment_name        = "prod_services"
  defined_tags            = local.tags_common
}

output "prod_services_compartment_id" {
  value = module.compartment-prod-services.compartment_id
}

############################################################################
# Non-Production Services:

module "compartment-nonprod-services" {
  source                  = "./modules/identity_compartment"
  tenancy_ocid            = var.tenancy_ocid
  compartment_description = "Non-Production Services"
  compartment_name        = "nonprod_services"
  defined_tags            = local.tags_common
}

output "nonprod_services_compartment_id" {
  value = module.compartment-nonprod-services.compartment_id
}

############################################################################
