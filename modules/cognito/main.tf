resource "aws_cognito_user_pool" "fiap-fastfood-user-pool" {
  mfa_configuration = "OFF"
  name              = "fiap-fastfood-user-pool-${var.env}"

  account_recovery_setting {
    recovery_mechanism {
      name     = "admin_only"
      priority = "1"
    }
  }

  admin_create_user_config {
    allow_admin_create_user_only = "false"
  }

  auto_verified_attributes = ["email"]
  deletion_protection      = "ACTIVE"

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  password_policy {
    minimum_length                   = "8"
    require_lowercase                = "false"
    require_numbers                  = "false"
    require_symbols                  = "false"
    require_uppercase                = "false"
    temporary_password_validity_days = "7"
  }

  schema {
    attribute_data_type      = "Number"
    developer_only_attribute = "false"
    mutable                  = "false"
    name                     = "cpf"
    required                 = "false"
    number_attribute_constraints {
      
    }
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = "false"
    mutable                  = "true"
    name                     = "email"
    required                 = "true"

    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    }
  }

  user_attribute_update_settings {
    attributes_require_verification_before_update = ["email"]
  }

  username_attributes = ["email"]

  username_configuration {
    case_sensitive = "false"
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
  }
}

resource "aws_cognito_user_pool_client" "fiap-fastfood-user-pool-client" {
  access_token_validity                         = "60"
  allowed_oauth_flows_user_pool_client          = "false"
  auth_session_validity                         = "3"
  enable_propagate_additional_user_context_data = "false"
  enable_token_revocation                       = "true"
  explicit_auth_flows                           = ["ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_PASSWORD_AUTH"]
  id_token_validity                             = "60"
  name                                          = "fiap-fastfood-user-pool-client-${var.env}"
  prevent_user_existence_errors                 = "ENABLED"
  read_attributes                               = ["custom:cpf", "email", "name"]
  refresh_token_validity                        = "30"

  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }

  user_pool_id     = "${aws_cognito_user_pool.fiap-fastfood-user-pool.id}"
  write_attributes = ["custom:cpf", "email", "name"]
}