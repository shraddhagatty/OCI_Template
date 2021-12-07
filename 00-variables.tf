############################################################################
# Variables:
############################################################################
# Tenancy:

variable "tenancy_ocid" {} 
variable "region" {}

#variable "user_ocid" {}
#variable "fingerprint" {}
#variable "private_key_path" {}


##Label used as a prefix for naming resources

variable "tags" {

    default = {
        "customer_label" = ""
        "StackName" = ""
        "StackOwner" = ""
        "ProjectName" = ""
        "BillingOwner" = ""
        "CostCenter" = ""
        "Workload" = ""

    }
  
}

variable customer_label{
    default = ""
}
/*
#Tags Name
variable "StackName" {
    default = ""
}
variable "StackOwner" {
    default = ""
}
variable "ProjectName" {
    default = ""
}
variable "BillingOwner" {
    default = ""
}
variable "CostCenter" {
    default = ""
}
variable "Workload" {
    default = ""
}
*/