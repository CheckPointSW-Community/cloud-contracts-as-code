variable "organization" {
  type = string
  description = "The name of the organization managing these rulesets."
  default = "Acme Corporation"
}

variable "contract_name" {
  type = string
  description = "The name of these rulesets."
  default = "Cloud Contract v1.0"
}

# set to true if you want to build for AWS
variable "use_aws" {
  default = false
}

# add AWS Dome9 id here, needed for compliance policy association
variable "aws_cloud_account_id" {
  default = ""
}

# add AWS account number here, needed for compliance policy association
variable "aws_account_number" {
  default = ""
}

# set to true if you want to build for Azure
variable "use_azure" {
  default = false
}

# add Azure Dome9 id here, needed for compliance policy association
variable "azure_cloud_account_id" {
  default = ""
}

# add Azure subscription here, needed for compliance policy association
variable "azure_account_subscription" {
  default = ""
}

# add Dome9 Access id here
variable "dome9_access_id" {
  default = ""
}

# add Dome9 Access secret key here
variable "dome9_secret_key" {
  default = ""
}

# add email recipient here
variable "email_recipients" {
  type = string
  default = ""
}


# SNS topic, needed for AWS cloudbots integration
variable "sns_topic_arn" {
  default = ""
}
