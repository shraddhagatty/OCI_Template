############################################################################
# Module Input Variables:
############################################################################

variable "tenancy_ocid" {
}

variable "user_desc" {
  default = ""
}

variable "user_name" {
}

variable "user_email" {
  default = ""
}

variable "group_id" {
}

variable "create_auth_token" {
  default = false
}

variable "create_ui_password" {
  default = false
}

variable "auth_token_desc" {
  default = "User Auth Token"
}

variable "user_ocid" {
}

variable "fingerprint" {
}

variable "private_key_path" {
}

variable "can_use_api_keys" {
  default = false
}

variable "can_use_auth_tokens" {
  default = true
}

variable "can_use_console_password" {
  default = false
}

variable "can_use_customer_secret_keys" {
  default = false
}

variable "can_use_smtp_credentials" {
  default = false
}

variable "defined_tags" {
    type = map(string)
}

############################################################################
