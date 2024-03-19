output "aws_cognito_user_pool_client_fiap-fastfood-user-pool-client_id" {
  value = "${aws_cognito_user_pool_client.fiap-fastfood-user-pool-client.id}"
}

output "aws_cognito_user_pool_fiap-fastfood-user-pool_id" {
  value = "${aws_cognito_user_pool.fiap-fastfood-user-pool.id}"
}
