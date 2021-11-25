############################################################################
# Module Output Values:
############################################################################

output "group_id" {
  value = oci_identity_group.group.id
}

output "policy_id" {
  value = oci_identity_policy.policy.id
}

output "policy_statements" {
  value = oci_identity_policy.policy.statements
}

############################################################################
