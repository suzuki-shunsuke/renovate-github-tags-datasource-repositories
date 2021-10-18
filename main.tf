# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster
resource "aws_rds_cluster" "aurora-postgresql" {
  engine         = "aurora-postgresql"
  engine_version = "11.9" # renovate: depName=suzuki-shunsuke/aws-rds-aurora-postgresql
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster
resource "aws_elasticache_cluster" "memcached" {
  engine         = "memcached"
  engine_version = "1.4.5" # renovate: depName=suzuki-shunsuke/aws-elasticache-memcached
}

resource "aws_elasticache_cluster" "redis" {
  engine         = "redis"
  engine_version = "5.0.6" # renovate: depName=suzuki-shunsuke/aws-elasticache-redis
}
