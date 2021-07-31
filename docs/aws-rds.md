# AWS RDS

[AWS RDS](https://docs.aws.amazon.com/en_us/AmazonRDS/latest/UserGuide/Welcome.html)

## Datasource repositories

* `aurora-postgresql`: https://github.com/suzuki-shunsuke/aws-rds-aurora-postgresql

## Example

* [Update dependency suzuki-shunsuke/aws-rds-aurora-postgresql to v12](https://github.com/suzuki-shunsuke/poc-renovate-aws-rds/pull/4)
* [Update dependency suzuki-shunsuke/aws-rds-aurora-postgresql to v11.11](https://github.com/suzuki-shunsuke/poc-renovate-aws-rds/pull/3)

[main.tf](https://github.com/suzuki-shunsuke/poc-renovate-aws-rds/blob/main/main.tf)

```tf
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster
resource "aws_rds_cluster" "aurora-postgresql" {
  engine         = "aurora-postgresql"
  engine_version = "11.9" # renovate: depName=suzuki-shunsuke/aws-rds-aurora-postgresql
  # ...
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

To get available RDS engine versions by AWS CLI, AWS Access key is required.
But the required permission is only `rds:DescribeDBEngineVersions`, so the risk is very low.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "rds:DescribeDBEngineVersions",
            "Resource": "*"
        }
    ]
}
```
