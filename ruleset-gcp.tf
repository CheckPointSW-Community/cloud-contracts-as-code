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
    # Ensure that Cloud Storage bucket is not anonymously and/or publicly accessible
    name = "Ensure that Cloud Storage bucket is not anonymously and/or publicly accessible"
    logic = "StorageBucket should not have iamPolicy with [ bindings contain [ members contain-any [ $ in ( 'allUsers', 'allAuthenticatedUsers' ) ] ] ]"
    severity = "High"
    description = "Sample description"
  }
}

##########################################
######### Add Compliance Policy ##########
##########################################

resource "dome9_continuous_compliance_policy" "dome9_gcp_compliance_policy" {
  count       = var.use_gcp ? 1 : 0
  target_id    = var.gcp_target_id
  target_type = "Gcp"
  ruleset_id           = dome9_ruleset.dome9_gcp_ruleset.*.id[count.index]
  notification_ids    = [ dome9_continuous_compliance_notification.dome9_compliance_mail_notification.id ]
}
