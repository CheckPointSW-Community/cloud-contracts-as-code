##########################################
############ Add Ruleset  ################
##########################################

resource "dome9_ruleset" "dome9_gcp_ruleset" {
  count       = var.use_gcp ? 1 : 0
  name        = "${var.organization} - ${var.contract_name} - GCP"
  description = "Built and maintained with Terraform"
  cloud_vendor = "google"
  language = "en"
  hide_in_compliance = false
  is_template = false
  rules {
    # Storage Buckets must always be encrypted
    name = "Storage Buckets must always be encrypted"
    logic = "GcpSecurityGroup should not have inboundRules contain [ destinationPort=3389 and source='0.0.0.0/0' ]"
    severity = "High"
    description = "Sample description"
  }
}

##########################################
######### Add Compliance Policy ##########
##########################################

resource "dome9_continuous_compliance_policy" "dome9_gcp_compliance_policy" {
  count       = var.use_gcp ? 1 : 0
  cloud_account_id    = var.gcp_cloud_account_id
  external_account_id = var.gcp_project_id
  bundle_id           = dome9_ruleset.dome9_gcp_ruleset.*.id[count.index]
  cloud_account_type  = "Google"
  notification_ids    = [ dome9_continuous_compliance_notification.dome9_compliance_mail_notification.id ]
}
