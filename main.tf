##########################################
######### Dome9 Provider Settings ########
##########################################

# Configure the Dome9 Provider access_id and secret_key
provider "dome9" {
  dome9_access_id = "${var.dome9_access_id}"
  dome9_secret_key = "${var.dome9_secret_key}"
}

##########################################
######### Add Notification Alert #########
##########################################

# Configure Compliance Mail Alert Notification
resource "dome9_continuous_compliance_notification" "dome9_compliance_mail_notification" {
  name           = "${var.organization} - Mail Alert"
  description    = "Built and maintained with Terraform"
  alerts_console = "true"

  change_detection {
    email_sending_state = "enabled"
    email_data {
      recipients = ["${var.email_recipients}"]
    }
  }
}

# Configure Compliance CloudBot Notification
resource "dome9_continuous_compliance_notification" "dome9_compliance_awscloudbot_notification" {
  name           = "${var.organization} - CloudBot"
  description    = "Built and maintained with Terraform"
  alerts_console = "false"

  change_detection {
    sns_sending_state   = "enabled"
    sns_data {
      sns_topic_arn = "${var.sns_topic_arn}"
      sns_output_format = "JsonWithFullEntity"
    }

  }
}