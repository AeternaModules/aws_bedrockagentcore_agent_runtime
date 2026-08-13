resource "aws_bedrockagentcore_agent_runtime" "bedrockagentcore_agent_runtimes" {
  for_each = var.bedrockagentcore_agent_runtimes

  agent_runtime_name    = each.value.agent_runtime_name
  role_arn              = each.value.role_arn
  description           = each.value.description
  environment_variables = each.value.environment_variables
  region                = each.value.region
  tags                  = each.value.tags

  dynamic "agent_runtime_artifact" {
    for_each = each.value.agent_runtime_artifact != null ? each.value.agent_runtime_artifact : []
    content {
      dynamic "code_configuration" {
        for_each = agent_runtime_artifact.value.code_configuration != null ? agent_runtime_artifact.value.code_configuration : []
        content {
          dynamic "code" {
            for_each = code_configuration.value.code != null ? code_configuration.value.code : []
            content {
              dynamic "s3" {
                for_each = code.value.s3 != null ? code.value.s3 : []
                content {
                  bucket     = s3.value.bucket
                  prefix     = s3.value.prefix
                  version_id = s3.value.version_id
                }
              }
            }
          }
          entry_point = code_configuration.value.entry_point
          runtime     = code_configuration.value.runtime
        }
      }
      dynamic "container_configuration" {
        for_each = agent_runtime_artifact.value.container_configuration != null ? agent_runtime_artifact.value.container_configuration : []
        content {
          container_uri = container_configuration.value.container_uri
        }
      }
    }
  }

  dynamic "authorizer_configuration" {
    for_each = each.value.authorizer_configuration != null ? each.value.authorizer_configuration : []
    content {
      dynamic "custom_jwt_authorizer" {
        for_each = authorizer_configuration.value.custom_jwt_authorizer != null ? authorizer_configuration.value.custom_jwt_authorizer : []
        content {
          allowed_audience = custom_jwt_authorizer.value.allowed_audience
          allowed_clients  = custom_jwt_authorizer.value.allowed_clients
          allowed_scopes   = custom_jwt_authorizer.value.allowed_scopes
          dynamic "allowed_workload_configuration" {
            for_each = custom_jwt_authorizer.value.allowed_workload_configuration != null ? custom_jwt_authorizer.value.allowed_workload_configuration : []
            content {
              dynamic "hosting_environment" {
                for_each = allowed_workload_configuration.value.hosting_environment != null ? allowed_workload_configuration.value.hosting_environment : []
                content {
                  arn = hosting_environment.value.arn
                }
              }
              workload_identities = allowed_workload_configuration.value.workload_identities
            }
          }
          dynamic "custom_claim" {
            for_each = custom_jwt_authorizer.value.custom_claim != null ? custom_jwt_authorizer.value.custom_claim : []
            content {
              dynamic "authorizing_claim_match_value" {
                for_each = custom_claim.value.authorizing_claim_match_value != null ? custom_claim.value.authorizing_claim_match_value : []
                content {
                  claim_match_operator = authorizing_claim_match_value.value.claim_match_operator
                  dynamic "claim_match_value" {
                    for_each = authorizing_claim_match_value.value.claim_match_value != null ? authorizing_claim_match_value.value.claim_match_value : []
                    content {
                      match_value_string      = claim_match_value.value.match_value_string
                      match_value_string_list = claim_match_value.value.match_value_string_list
                    }
                  }
                }
              }
              inbound_token_claim_name       = custom_claim.value.inbound_token_claim_name
              inbound_token_claim_value_type = custom_claim.value.inbound_token_claim_value_type
            }
          }
          discovery_url = custom_jwt_authorizer.value.discovery_url
          dynamic "private_endpoint" {
            for_each = custom_jwt_authorizer.value.private_endpoint != null ? custom_jwt_authorizer.value.private_endpoint : []
            content {
              dynamic "managed_vpc_resource" {
                for_each = private_endpoint.value.managed_vpc_resource != null ? private_endpoint.value.managed_vpc_resource : []
                content {
                  endpoint_ip_address_type = managed_vpc_resource.value.endpoint_ip_address_type
                  routing_domain           = managed_vpc_resource.value.routing_domain
                  security_group_ids       = managed_vpc_resource.value.security_group_ids
                  subnet_ids               = managed_vpc_resource.value.subnet_ids
                  tags                     = managed_vpc_resource.value.tags
                  vpc_identifier           = managed_vpc_resource.value.vpc_identifier
                }
              }
              dynamic "self_managed_lattice_resource" {
                for_each = private_endpoint.value.self_managed_lattice_resource != null ? private_endpoint.value.self_managed_lattice_resource : []
                content {
                  resource_configuration_identifier = self_managed_lattice_resource.value.resource_configuration_identifier
                }
              }
            }
          }
          dynamic "private_endpoint_overrides" {
            for_each = custom_jwt_authorizer.value.private_endpoint_overrides != null ? custom_jwt_authorizer.value.private_endpoint_overrides : []
            content {
              domain = private_endpoint_overrides.value.domain
              dynamic "private_endpoint" {
                for_each = private_endpoint_overrides.value.private_endpoint != null ? private_endpoint_overrides.value.private_endpoint : []
                content {
                  dynamic "managed_vpc_resource" {
                    for_each = private_endpoint.value.managed_vpc_resource != null ? private_endpoint.value.managed_vpc_resource : []
                    content {
                      endpoint_ip_address_type = managed_vpc_resource.value.endpoint_ip_address_type
                      routing_domain           = managed_vpc_resource.value.routing_domain
                      security_group_ids       = managed_vpc_resource.value.security_group_ids
                      subnet_ids               = managed_vpc_resource.value.subnet_ids
                      tags                     = managed_vpc_resource.value.tags
                      vpc_identifier           = managed_vpc_resource.value.vpc_identifier
                    }
                  }
                  dynamic "self_managed_lattice_resource" {
                    for_each = private_endpoint.value.self_managed_lattice_resource != null ? private_endpoint.value.self_managed_lattice_resource : []
                    content {
                      resource_configuration_identifier = self_managed_lattice_resource.value.resource_configuration_identifier
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "filesystem_configuration" {
    for_each = each.value.filesystem_configuration != null ? each.value.filesystem_configuration : []
    content {
      dynamic "efs_access_point" {
        for_each = filesystem_configuration.value.efs_access_point != null ? filesystem_configuration.value.efs_access_point : []
        content {
          access_point_arn = efs_access_point.value.access_point_arn
          mount_path       = efs_access_point.value.mount_path
        }
      }
      dynamic "s3_files_access_point" {
        for_each = filesystem_configuration.value.s3_files_access_point != null ? filesystem_configuration.value.s3_files_access_point : []
        content {
          access_point_arn = s3_files_access_point.value.access_point_arn
          mount_path       = s3_files_access_point.value.mount_path
        }
      }
      dynamic "session_storage" {
        for_each = filesystem_configuration.value.session_storage != null ? filesystem_configuration.value.session_storage : []
        content {
          mount_path = session_storage.value.mount_path
        }
      }
    }
  }

  dynamic "lifecycle_configuration" {
    for_each = each.value.lifecycle_configuration != null ? each.value.lifecycle_configuration : []
    content {
      idle_runtime_session_timeout = lifecycle_configuration.value.idle_runtime_session_timeout
      max_lifetime                 = lifecycle_configuration.value.max_lifetime
    }
  }

  dynamic "network_configuration" {
    for_each = each.value.network_configuration != null ? each.value.network_configuration : []
    content {
      network_mode = network_configuration.value.network_mode
      dynamic "network_mode_config" {
        for_each = network_configuration.value.network_mode_config != null ? network_configuration.value.network_mode_config : []
        content {
          security_groups = network_mode_config.value.security_groups
          subnets         = network_mode_config.value.subnets
        }
      }
    }
  }

  dynamic "protocol_configuration" {
    for_each = each.value.protocol_configuration != null ? each.value.protocol_configuration : []
    content {
      server_protocol = protocol_configuration.value.server_protocol
    }
  }

  dynamic "request_header_configuration" {
    for_each = each.value.request_header_configuration != null ? each.value.request_header_configuration : []
    content {
      request_header_allowlist = request_header_configuration.value.request_header_allowlist
    }
  }
}

