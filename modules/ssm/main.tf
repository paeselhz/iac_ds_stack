data "aws_directory_service_directory" "ad_info" {
  directory_id = var.ad_id
}

resource "aws_ssm_document" "ad-join-domain" {
  name          = "ad-join-domain"
  document_type = "Command"

  content = <<DOC
    {
      "schemaVersion": "2.2"
      "description": "aws:domainJoin"
      "mainSteps": [
        {
          "action": "aws:domainJoin",
          "name": "domainJoin",
          "inputs": {
            "directoryId" : ${var.ad_id},
            "directoryName" : ${data.aws_directory_service_directory.ad_info.name},
            "dnsIpAddresses" : ""
          }
        }
      ]
    }
  DOC
}

resource "aws_ssm_association" "linux_association" {
  name = aws_ssm_document.ad-join-domain.name
  targets {
    key    = "InstanceIds"
    values = [var.instance_ids]
  }
}