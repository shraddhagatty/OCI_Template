############################################################################
# Module Definition:
############################################################################
# User:

resource "oci_identity_user" "user" {
  compartment_id = var.tenancy_ocid
  description    = var.user_desc
  name           = var.user_name
  email          = var.user_email
  defined_tags   = var.defined_tags
  lifecycle {
    ignore_changes = [
      defined_tags["Oracle-Tags.CreatedBy"],
      defined_tags["Oracle-Tags.CreatedOn"],
      defined_tags["Account.Created_By"],
      defined_tags["Account.Created_At"],
    ]
  }
}

############################################################################
# UI Password:

resource "oci_identity_ui_password" "ui_password" {
  count   = var.create_ui_password ? 1 : 0
  user_id = oci_identity_user.user.id
}

############################################################################
# Capabilities:

resource "oci_identity_user_capabilities_management" "user_capabilities_management" {
  user_id                      = oci_identity_user.user.id
  can_use_api_keys             = var.can_use_api_keys
  can_use_auth_tokens          = var.can_use_auth_tokens
  can_use_console_password     = var.can_use_console_password
  can_use_customer_secret_keys = var.can_use_customer_secret_keys
  can_use_smtp_credentials     = var.can_use_smtp_credentials
}

############################################################################
# Group Membership:

resource "oci_identity_user_group_membership" "user_group_membership" {
  group_id = var.group_id
  user_id  = oci_identity_user.user.id
}

############################################################################
# Optional - Auth Token:

resource "oci_identity_auth_token" "auth_token" {
  count       = var.create_auth_token ? 1 : 0
  description = var.auth_token_desc
  user_id     = oci_identity_user.user.id
}

############################################################################
