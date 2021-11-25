############################################################################
# Module Definition:
############################################################################
# Namespace:

resource "oci_identity_tag_namespace" "tag_namespace" {
  compartment_id = var.compartment_id
  description    = var.namespace_desc
  name           = var.namespace_name
  is_retired     = var.is_retired
}

############################################################################
# Default Tags - Account:

resource "oci_identity_tag" "tag_stack_name" {
  count            = var.create_defaults_account ? 1 : 0
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace.id
  description      = "Product/Environment title."
  name             = "StackName"
}

resource "oci_identity_tag" "tag_stack_owner" {
  count            = var.create_defaults_account ? 1 : 0
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace.id
  description      = "Product Owner."
  name             = "StackOwner"
}

resource "oci_identity_tag" "tag_project" {
  count            = var.create_defaults_account ? 1 : 0
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace.id
  description      = "Internal customer project title."
  name             = "ProjectName"
}

resource "oci_identity_tag" "tag_billing_owner" {
  count            = var.create_defaults_account ? 1 : 0
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace.id
  description      = "Name of customer contact who administers the project."
  name             = "BillingOwner"
}

resource "oci_identity_tag" "tag_compartment_name" {
  count            = var.create_defaults_account ? 1 : 0
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace.id
  description      = "The compartment the resource belongs to."
  name             = "CompartmentName"
}

############################################################################
# Default Tags - Billing:

resource "oci_identity_tag" "tag_cost_centre" {
  count            = var.create_defaults_billing ? 1 : 0
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace.id
  description      = "Internal customer cost centre."
  name             = "CostCentre"
  is_cost_tracking = true
}

resource "oci_identity_tag" "tag_workload" {
  count            = var.create_defaults_billing ? 1 : 0
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace.id
  description      = "Workload type."
  name             = "Workload"
  is_cost_tracking = true
}

resource "oci_identity_tag" "tag_environment" {
  count            = var.create_defaults_billing ? 1 : 0
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace.id
  description      = "Environment type."
  name             = "Environment"
  is_cost_tracking = true
}

############################################################################
