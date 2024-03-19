locals {
  rule_directories = toset(["CCR-001", "CCR-002"])

  rules_data = { for dir in local.rule_directories :
    dir => {
      metadata    = jsondecode(file("${path.module}/cloud_config_rules/${dir}/metadata/metadata.json"))
      description = file("${path.module}/cloud_config_rules/${dir}/metadata/description.md")
      remediation = file("${path.module}/cloud_config_rules/${dir}/metadata/remediation.md")
      rule_rego   = file("${path.module}/cloud_config_rules/${dir}/rule.rego")
    }
  }
}

resource "wiz_cloud_configuration_rule" "this" {
  for_each = local.rules_data

  name                     = each.value.metadata.name
  description              = each.value.description
  remediation_instructions = each.value.remediation
  severity                 = each.value.metadata.severity
  function_as_control      = each.value.metadata.function_as_control
  target_native_types      = each.value.metadata.target_native_types

  opa_policy = each.value.rule_rego
}
