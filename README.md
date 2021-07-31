# renovate-github-tags-datasource-repositories

[Renovate](https://github.com/renovatebot/renovate) `github-tags` Datasource Repositories.

## Overview

There are packages which it is difficult to update them by Renovate.
For example, there is no Renovate [Managers](https://docs.renovatebot.com/modules/manager/) and [Datasources](https://docs.renovatebot.com/modules/datasource/) for AWS RDS and Elasticache engine version.

So we create GitHub repositories as `github-tags` Datasources to update them by [Regex Managers](https://docs.renovatebot.com/modules/manager/regex/).

In those repositories, Git tags are synchronized with package's version periodically. 

## Datasource repositories

* [AWS RDS](docs/aws-rds.md)

## How Git tags are synchronized with package's version periodically?

In those repositories, GitHub Actions is run daily and available package's versions are gotten and Git tags are pushed to the repositories.
For example, AWS RDS engine versions are gotten by [aws rds describe-db-engine-versions](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/rds/describe-db-engine-versions.html).

## LICENSE

[MIT](LICENSE)
