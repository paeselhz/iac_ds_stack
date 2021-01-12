resource "aws_ssm_document" "ad-join-domain" {
  name          = "ad-join-domain"
  document_type = "Command"

  content = <<DOC
    {
      "schemaVersion" = "2.2"
      "description"   = "aws:domainJoin"
      "mainSteps" = [
        {
          "action" = "aws:domainJoin",
          "name"   = "domainJoin",
          "inputs" = {
            "directoryId" : ${var.ad_id},
            "directoryName" : ${var.ad_name},
            "dnsIpAddresses" : sort(${var.ad_dns_addresses})
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