variable "organization" {
  type = string
  description = "The name of the organization managing these rulesets."
}

variable "contract_name" {
  type = string
  description = "The name of these rulesets."
}

# add AWS Dome9 id here, needed for compliance policy association
variable "aws_cloud_account_id" {
  default = ""
}

# add AWS account number here, needed for compliance policy association
variable "aws_account_number" {
  default = ""
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
  default = ""
}


# SNS topic, needed for AWS cloudbots integration
variable "sns_topic_arn" {
  default = ""
}
