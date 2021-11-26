# ############################################################################
# # Tags:
# ############################################################################
# # Account Tags:

 module "tag_namespace_account" {
  source                  = "./modules/tag_namespace"
  compartment_id          = var.tenancy_ocid
  namespace_desc          = "Tag namespace for Account references."
  namespace_name          = "Account"
  create_defaults_account = true
 }
# ############################################################################
# Billing Tags:

module "tag_namespace_billing" {
  source                  = "./modules/tag_namespace"
  compartment_id          = var.tenancy_ocid
  namespace_desc          = "Tag namespace for Billing cost-tracking references."
  namespace_name          = "Billing"
  create_defaults_billing = true
}

############################################################################
# Tag List
locals {

  tags_common = {
    "Account.CompartmentName" = "common_services"
    "Account.StackName"       = var.StackName
    "Account.StackOwner"      = var.StackOwner
    "Account.ProjectName"     = var.ProjectName
    "Account.BillingOwner"    = var.BillingOwner
    "Billing.CostCentre"      = var.CostCenter
    "Billing.Workload"        = var.Workload
    "Billing.Environment"     = "Common"
  }

  tags_prd = {

    "Account.CompartmentName" = "production_services"
    "Account.StackName"       = var.StackName
    "Account.StackOwner"      = var.StackOwner
    "Account.ProjectName"     = var.ProjectName
    "Account.BillingOwner"    = var.BillingOwner
    "Billing.CostCentre"      = var.CostCenter
    "Billing.Workload"        = var.Workload
    "Billing.Environment"     = "Production"

  }

  tags_nprd = {

    "Account.CompartmentName" = "nonproduction_services"
    "Account.StackName"       = var.StackName
    "Account.StackOwner"      = var.StackOwner
    "Account.ProjectName"     = var.ProjectName
    "Account.BillingOwner"    = var.BillingOwner
    "Billing.CostCentre"      = var.CostCenter
    "Billing.Workload"        = var.Workload
    "Billing.Environment"     = "NonProduction"

  }

}

############################################################################
#Scheduling Tags:

# Account Tags:
resource "oci_identity_tag_namespace" "tag_namespace_scheduling" {
  compartment_id = var.tenancy_ocid
  description    = "Tag namespace for Scheduling instances"
  name           = "Schedule"
  is_retired     = false
}

resource "oci_identity_tag" "tag_weekday" {
  # provider       = oci.home
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace_scheduling.id
  description      = "schedule for weekdays"
  name             = "WeekDay"
}

resource "oci_identity_tag" "tag_weekend" {
  # provider       = oci.home
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace_scheduling.id
  description      = "schedule for weekends"
  name             = "Weekend"
}

resource "oci_identity_tag" "tag_monday" {
  # provider       = oci.home
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace_scheduling.id
  description      = "schedule for Monday"
  name             = "Monday"
}

resource "oci_identity_tag" "tag_tuesday" {
  # provider       = oci.home
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace_scheduling.id
  description      = "schedule for Tuesday"
  name             = "Tuesday"
}

resource "oci_identity_tag" "tag_wednesday" {
  # provider       = oci.home
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace_scheduling.id
  description      = "schedule for Wednesday"
  name             = "Wednesday"
}

resource "oci_identity_tag" "tag_thursday" {
  # provider       = oci.home
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace_scheduling.id
  description      = "schedule for Thursday"
  name             = "Thursday"
}

resource "oci_identity_tag" "tag_friday" {
  # provider       = oci.home
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace_scheduling.id
  description      = "schedule for Friday"
  name             = "Friday"
}

resource "oci_identity_tag" "tag_saturday" {
  # provider       = oci.home
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace_scheduling.id
  description      = "schedule for Saturday"
  name             = "Saturday"
}

resource "oci_identity_tag" "tag_sunday" {
  # provider       = oci.home
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace_scheduling.id
  description      = "schedule for Sunday"
  name             = "Sunday"
}

resource "oci_identity_tag" "tag_anyday" {
  # provider       = oci.home
  tag_namespace_id = oci_identity_tag_namespace.tag_namespace_scheduling.id
  description      = "schedule for anyday"
  name             = "AnyDay"
}
#######################################################


