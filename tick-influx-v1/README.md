# AWS Beanstalk + RDS Monitoring Stack

TO DO to use...
- specify terraform values
- correct set conf values/secrets
- update telegraf config

## Components
Basic "TICK" stack:
- **Telegraf**: collects system & MySQL metrics
- **InfluxDB**: stores metrics
- **Chronograf**: dashboards
- **Kapacitor**: alerts (Slack)
- **Terraform**: provision EC2 + security groups

## Usage
Note that this describes a manual deployment, _not_ for a pipeline build, as it includes manually appending variables/secrets to the files and deploying.
1. Clone this repo
2. Update Terraform variables (`terraform.tfvars`)
3. Update docker/*.conf and beanstalk conf values
3. Run `terraform init && terraform apply`
4. Log into EC2 and run `docker-compose up -d`
5. Import dashboards via Chronograf UI
6. Use `.ebextensions` to collect system metrics from Beanstalk EC2s

## Dashboards
- `dashboards/mysql_dashboard.json`
- `dashboards/system_metrics_dashboard.json`

## Alerts
- `kapacitor/slow_queries.tick`
- `kapacitor/high_cpu.tick`

## Resources
* Chronograf
  * [home page](https://www.influxdata.com/time-series-platform/chronograf/)
  * [GitHub repo](https://github.com/influxdata/chronograf)
  * [Example MySql protoboard](https://github.com/influxdata/chronograf/blob/master/protoboards/mysql.json)
* [Overview](https://best-of-web.builder.io/library/influxdata/chronograf)