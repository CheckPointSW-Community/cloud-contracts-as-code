# Cloud Contracts as Code

Examples of using Dome9 Terraform Provider to build a Cloud Security Contract or Compliance Ruleset

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

Clone the repository and create a terraform.tfvars file within the root folder with contents like these (use your details):

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
