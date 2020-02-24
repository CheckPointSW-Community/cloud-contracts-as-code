##########################################
############ Add Ruleset  ################
##########################################
resource "dome9_ruleset" "dome9_aws_ruleset" {
  name        = "${var.organization} - ${var.contract_name} - AWS Ruleset"
  description = "Built and maintained with Terraform"
  cloud_vendor = "AWS"
  language = "en"
  hide_in_compliance = false
  is_template = false
  rules {
    # Storage Buckets with data classification 'secret' must always be encrypted
    name = "Storage Buckets with data classification 'secret' must always be encrypted"
    logic = "S3Bucket where tags contain [ key='data-classification' and value='secret' ] should have encryption.serverSideEncryptionRules"
    severity = "High"
    description = "Ensure that S3 Buckets with data classification 'secret' have server side encryption at rest enabled to protect sensitive data."
    compliance_tag = "AUTO: s3_enable_encryption"
  }
  rules {
    # Storage buckets must always be Private unless tagged with: PublicBucketXYZ
    name = "Storage buckets must always be Private unless tagged with: PublicBucketXYZ"
    logic = "S3Bucket where not tags with [ value like 'PublicBucketXYZ' ] should not have ( acl.grants contain [uri like 'http://acs.amazonaws.com/groups/global/%'] or policy.Statement contain [Effect='Allow' and (Principal='*' or Principal.AWS='*')])"
    severity = "Medium"
    description = "Storage buckets must always be Private unless tagged with: PublicBucketXYZ"
    compliance_tag = "AUTO: s3_delete_permissions"
  }
}

##########################################
######### Add Compliance Policy ##########
##########################################

resource "dome9_continuous_compliance_policy" "dome9_aws_compliance_policy" {
  cloud_account_id    = "${var.aws_cloud_account_id}"
  external_account_id = "${var.aws_account_number}"
  bundle_id           = "${dome9_ruleset.dome9_aws_ruleset.id}"
  cloud_account_type  = "Aws"
  notification_ids    = ["${dome9_continuous_compliance_notification.dome9_compliance_mail_notification.id}", "${dome9_continuous_compliance_notification.dome9_compliance_awscloudbot_notification.id}"]
}
