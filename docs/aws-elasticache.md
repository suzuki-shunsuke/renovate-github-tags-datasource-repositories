# AWS Elasticache

[AWS Elasticache](https://docs.aws.amazon.com/elasticache/index.html)

## Datasource repositories

* `memcached`: https://github.com/suzuki-shunsuke/aws-elasticache-memcached
* `redis`: https://github.com/suzuki-shunsuke/aws-elasticache-redis

## Example

[main.tf](https://github.com/suzuki-shunsuke/poc-renovate-aws-rds/blob/main/main.tf)

```tf
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster
resource "aws_elasticache_cluster" "memcached" {
  engine         = "memcached"
  engine_version = "1.4.5" # renovate: depName=suzuki-shunsuke/aws-elasticache-memcached
  # ...
}

resource "aws_elasticache_cluster" "redis" {
  engine         = "redis"
  engine_version = "5.0.0" # renovate: depName=suzuki-shunsuke/aws-elasticache-redis
}
```

[renovate.json5](https://github.com/suzuki-shunsuke/poc-renovate-aws-rds/blob/main/renovate.json5)

```json5
{
  extends: ["config:base"],
  regexManagers: [
    {
      fileMatch: ["\\.tf$"],
      matchStrings: [
        '"(?<currentValue>.*?)" # renovate: depName=(?<depName>.*?)\\n',
      ],
      datasourceTemplate: "github-tags",
      versioningTemplate: "docker", // RDS engine version is invalid semver
    },
  ],
}
```

## Self host Datasource repositories

If you want to manage Datasource repositories by yourself, please clone datasource repositories and configure the following secrets.

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY

To get available Elasticache engine versions by AWS CLI, AWS Access key is required.
But the required permission is only `elasticache:DescribeCacheEngineVersions`, so the risk is very low.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "elasticache:DescribeCacheEngineVersions",
            "Resource": "*"
        }
    ]
}
```
