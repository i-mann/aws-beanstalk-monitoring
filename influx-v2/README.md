# AWS Beanstalk Monitoring Stack (InfluxDB 2.x)

## Components
- **Telegraf** for metrics collection
- **InfluxDB 2.x** for storage and UI dashboards
- **Terraform** to provision monitoring EC2 instance

## Setup
1. Clone the repo
2. Customize `terraform/variables.tf`
3. Run `terraform init && terraform apply`
4. Access InfluxDB 2 UI at `http://<public_ip>:8086`

On telegraf config
Beanstalk Telegraf Config: Install Telegraf via .ebextensions (same method as before), but update outputs.influxdb_v2.

## Add Beanstalk Metrics
Include the `.ebextensions` config to install and point Telegraf to InfluxDB

## Dashboarding
Create dashboards using the InfluxDB UI. Use or modify the sample `mysql_dashboard.json`

## Alerts
Use InfluxDB UI: Alerts > Checks + Notification Rules

## Slack Alerts
1. Create a Slack Incoming Webhook URL
2. Use the Influx UI or the following JSON files to create:
   - `slack_endpoint.json`: defines the Slack endpoint
   - `slack_notification_rule.json`: rule to send alerts when slow queries exceed 10

You can import these via Influx API:
```bash
curl -X POST http://<influx-url>/api/v2/notificationEndpoints \
  -H "Authorization: Token my-secret-token" \
  -H "Content-Type: application/json" \
  -d @influxdb2/slack_endpoint.json

curl -X POST http://<influx-url>/api/v2/notificationRules \
  -H "Authorization: Token my-secret-token" \
  -H "Content-Type: application/json" \
  -d @influxdb2/slack_notification_rule.json
```

You will need your organization ID (`orgID`) and the returned Slack endpoint ID (`endpointID`).
