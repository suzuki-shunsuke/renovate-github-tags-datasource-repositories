resource "aws_rds_cluster" "aurora-postgresql" {
  engine         = "aurora-postgresql"
  engine_version = "11.9" # renovate: depName=suzuki-shunsuke/aws-rds-aurora-postgresql
}
