variable "organization" {
  type = string
  description = "The name of the organization managing these rulesets."
  #default = "Acme Corporation"
}

variable "contract_name" {
  type = string
  description = "The name of these rulesets."
  #default = "Cloud Contract v1.0"
}

variable "use_aws" {
  default = false
}

variable "aws_cloud_account_id" {
  default = ""
}

variable "aws_account_number" {
  default = ""
}

variable "use_azure" {
  default = false
}

variable "azure_cloud_account_id" {
  default = ""
}

variable "azure_account_subscription" {
  default = ""
}

variable "use_gcp" {
  default = false
}

variable "gcp_cloud_account_id" {
  default = ""
}

variable "gcp_project_id" {
  default = ""
}

variable "dome9_access_id" {
  default = ""
}

variable "dome9_secret_key" {
  default = ""
}

variable "email_recipients" {
  type = string
  default = ""
}

variable "sns_topic_arn" {
  default = ""
}
