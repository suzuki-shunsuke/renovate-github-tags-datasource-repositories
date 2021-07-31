# poc-renovate-aws-rds

POC to update [AWS RDS](https://docs.aws.amazon.com/en_us/AmazonRDS/latest/UserGuide/Welcome.html) engine version with [Renovate](https://github.com/renovatebot/renovate).

## Overview

There is no Renovate [Managers](https://docs.renovatebot.com/modules/manager/) and [Datasources](https://docs.renovatebot.com/modules/datasource/) for AWS RDS engine version.
So we create GitHub repositories as `github-tags` Datasources to update RDS engine version by [Regex Managers](https://docs.renovatebot.com/modules/manager/regex/).

In their repositories, Git tags are synchronized with RDS engine version periodically. 

## Datasource repositories

There are Datasource repositories per RDS engine.

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

## How Git tags are synchronized with RDS engine version periodically?

In their repositories, GitHub Actions is run daily and available AWS RDS engine versions are gotten by [aws rds describe-db-engine-versions](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/rds/describe-db-engine-versions.html) and Git tags are pushed to the repositories.

## LICENSE

[MIT](LICENSE)
