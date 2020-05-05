# Cloud Contracts as Code

## Overview

Cloud Contracts as Code are examples of using the Dome9 Terraform Provider to build a Cloud Security Contract or Compliance Ruleset for the public cloud. By using Terraform for your cloud contracts you automate the process of creating and maintaining your policies and guardrails.

## What does it do?

The example configuration supports building custom rules for Azure, AWS and GCP with the [Dome9 GSL language](https://gsl.dome9.com/). It creates a mail alert and attaches the alert with the specified cloud account through a notification policy. 

A additional CloudBot alert and notification policy gets configured with the specified SNS topic ARN for automatic remediation with [Cloudbots.io](https://cloudbots.dome9.com/). For the remediative action to happen the CloudBots should be installed in your cloud account first.

## Requirements

-	[Terraform](https://www.terraform.io/downloads.html) 0.12.x
-	[Terraform Dome9 Provider](https://www.terraform.io/docs/providers/dome9/) > 1.17.x

## Sample Cloud Security Contract

- Storage Buckets must always be encrypted
- Storage buckets must always be Private unless tagged with: PublicBucketXYZ
- Load Balancers use TLS 1.2 and above
- In PROD and STAGE only use RHEL 7.3
- Everyone must use SSO with MFA enabled
- DEV should only use US-East2 or US-West2

## Usage

- Clone the repository and create a terraform.tfvars file within the root folder with contents like these (use your details):

```
### General settings
dome9_access_id = ""
dome9_secret_key = ""
email_recipients = ""
sns_topic_arn = ""

### AWS Settings, if applicable
use_aws = true
aws_cloud_account_id = ""
aws_account_number = ""

### Azure Settings, if applicable
use_azure = true
azure_cloud_account_id = ""
azure_account_subscription = ""

### Google Settings, if applicable
use_gcp = true
gcp_cloud_account_id = ""
gcp_project_id = ""
``` 

- From a command line initialize the Terraform configuration directory:

  terraform init
- Create an execution plan:

  terraform plan
- Create or modify the deployment:

  terraform apply

## References
* [CloudGuard Dome9 GSL Language](https://sc1.checkpoint.com/documents/CloudGuard_Dome9/Documentation/PostureManagement/GSL.html?tocpath=Posture%20Management%7CThe%20CloudGuard%20Dome9%20GSL%20Language%7C_____0)
* [CloudGuard Dome9 Alerts and Notifications](https://sc1.checkpoint.com/documents/CloudGuard_Dome9/Documentation/Alerts-Notifications/Alerts-and-Notification.html)
* [Dome9 Cloud Security Posture Repository (CSPR)](https://gsl.dome9.com/)
