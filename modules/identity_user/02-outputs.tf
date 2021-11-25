############################################################################
# Module Output Values:
############################################################################

output "user_id" {
  value = oci_identity_user.user.id
}

output "user_capabilities" {
  value = oci_identity_user.user.capabilities
}

output "user_password" {
  value = oci_identity_ui_password.ui_password.*.password
}

output "user_group_membership_id" {
  value = oci_identity_user_group_membership.user_group_membership.id
}

output "user_auth_token" {
  value = oci_identity_auth_token.auth_token.*.token
}

############################################################################
