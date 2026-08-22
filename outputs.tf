output "bedrockagentcore_agent_runtimes_agent_runtime_arn" {
  description = "Map of agent_runtime_arn values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.agent_runtime_arn if v.agent_runtime_arn != null && length(v.agent_runtime_arn) > 0 }
}
output "bedrockagentcore_agent_runtimes_agent_runtime_artifact" {
  description = "Map of agent_runtime_artifact values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.agent_runtime_artifact if v.agent_runtime_artifact != null && length(v.agent_runtime_artifact) > 0 }
}
output "bedrockagentcore_agent_runtimes_agent_runtime_id" {
  description = "Map of agent_runtime_id values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.agent_runtime_id if v.agent_runtime_id != null && length(v.agent_runtime_id) > 0 }
}
output "bedrockagentcore_agent_runtimes_agent_runtime_name" {
  description = "Map of agent_runtime_name values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.agent_runtime_name if v.agent_runtime_name != null && length(v.agent_runtime_name) > 0 }
}
output "bedrockagentcore_agent_runtimes_agent_runtime_version" {
  description = "Map of agent_runtime_version values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.agent_runtime_version if v.agent_runtime_version != null && length(v.agent_runtime_version) > 0 }
}
output "bedrockagentcore_agent_runtimes_authorizer_configuration" {
  description = "Map of authorizer_configuration values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.authorizer_configuration if v.authorizer_configuration != null && length(v.authorizer_configuration) > 0 }
}
output "bedrockagentcore_agent_runtimes_description" {
  description = "Map of description values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.description if v.description != null && length(v.description) > 0 }
}
output "bedrockagentcore_agent_runtimes_environment_variables" {
  description = "Map of environment_variables values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.environment_variables if v.environment_variables != null && length(v.environment_variables) > 0 }
}
output "bedrockagentcore_agent_runtimes_filesystem_configuration" {
  description = "Map of filesystem_configuration values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.filesystem_configuration if v.filesystem_configuration != null && length(v.filesystem_configuration) > 0 }
}
output "bedrockagentcore_agent_runtimes_lifecycle_configuration" {
  description = "Map of lifecycle_configuration values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.lifecycle_configuration if v.lifecycle_configuration != null && length(v.lifecycle_configuration) > 0 }
}
output "bedrockagentcore_agent_runtimes_network_configuration" {
  description = "Map of network_configuration values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.network_configuration if v.network_configuration != null && length(v.network_configuration) > 0 }
}
output "bedrockagentcore_agent_runtimes_protocol_configuration" {
  description = "Map of protocol_configuration values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.protocol_configuration if v.protocol_configuration != null && length(v.protocol_configuration) > 0 }
}
output "bedrockagentcore_agent_runtimes_region" {
  description = "Map of region values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.region if v.region != null && length(v.region) > 0 }
}
output "bedrockagentcore_agent_runtimes_request_header_configuration" {
  description = "Map of request_header_configuration values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.request_header_configuration if v.request_header_configuration != null && length(v.request_header_configuration) > 0 }
}
output "bedrockagentcore_agent_runtimes_role_arn" {
  description = "Map of role_arn values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.role_arn if v.role_arn != null && length(v.role_arn) > 0 }
}
output "bedrockagentcore_agent_runtimes_tags" {
  description = "Map of tags values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "bedrockagentcore_agent_runtimes_tags_all" {
  description = "Map of tags_all values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "bedrockagentcore_agent_runtimes_workload_identity_details" {
  description = "Map of workload_identity_details values across all bedrockagentcore_agent_runtimes, keyed the same as var.bedrockagentcore_agent_runtimes"
  value       = { for k, v in aws_bedrockagentcore_agent_runtime.bedrockagentcore_agent_runtimes : k => v.workload_identity_details if v.workload_identity_details != null && length(v.workload_identity_details) > 0 }
}

