resource "aws_secretsmanager_secret" "rds_secret_manager_fiap_fastfood" {
  name        = "rds_secret_manager_fiap_fastfood-${var.env}"
  description = "Secret Manager com as credenciais e configurações de acesso aos bancos de dados do RDS"
  recovery_window_in_days = 0
}

variable "initial" {
  default = {
    DB_HOSTNAME = null
    DB_USER = null
    DB_PASSWORD = null
    DB_PORT = 5432
  }

  type = map(string)
}

resource "aws_secretsmanager_secret_version" "version1" {
  secret_id     = aws_secretsmanager_secret.rds_secret_manager_fiap_fastfood.id
  secret_string = jsonencode(var.initial)
}