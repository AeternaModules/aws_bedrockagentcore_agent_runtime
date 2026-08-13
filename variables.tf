variable "bedrockagentcore_agent_runtimes" {
  description = <<EOT
Map of bedrockagentcore_agent_runtimes, attributes below
Required:
    - agent_runtime_name
    - role_arn
Optional:
    - description
    - environment_variables
    - region
    - tags
    - agent_runtime_artifact (block):
        - code_configuration (optional, block):
            - code (optional, block):
                - s3 (optional, block):
                    - bucket (required)
                    - prefix (required)
                    - version_id (optional)
            - entry_point (required)
            - runtime (required)
        - container_configuration (optional, block):
            - container_uri (required)
    - authorizer_configuration (block):
        - custom_jwt_authorizer (optional, block):
            - allowed_audience (optional)
            - allowed_clients (optional)
            - allowed_scopes (optional)
            - allowed_workload_configuration (optional, block):
                - hosting_environment (optional, block):
                    - arn (required)
                - workload_identities (optional)
            - custom_claim (optional, block):
                - authorizing_claim_match_value (optional, block):
                    - claim_match_operator (required)
                    - claim_match_value (optional, block):
                        - match_value_string (optional)
                        - match_value_string_list (optional)
                - inbound_token_claim_name (required)
                - inbound_token_claim_value_type (required)
            - discovery_url (required)
            - private_endpoint (optional, block):
                - managed_vpc_resource (optional, block):
                    - endpoint_ip_address_type (required)
                    - routing_domain (optional)
                    - security_group_ids (optional)
                    - subnet_ids (required)
                    - tags (optional)
                    - vpc_identifier (required)
                - self_managed_lattice_resource (optional, block):
                    - resource_configuration_identifier (required)
            - private_endpoint_overrides (optional, block):
                - domain (required)
                - private_endpoint (optional, block):
                    - managed_vpc_resource (optional, block):
                        - endpoint_ip_address_type (required)
                        - routing_domain (optional)
                        - security_group_ids (optional)
                        - subnet_ids (required)
                        - tags (optional)
                        - vpc_identifier (required)
                    - self_managed_lattice_resource (optional, block):
                        - resource_configuration_identifier (required)
    - filesystem_configuration (block):
        - efs_access_point (optional, block):
            - access_point_arn (required)
            - mount_path (required)
        - s3_files_access_point (optional, block):
            - access_point_arn (required)
            - mount_path (required)
        - session_storage (optional, block):
            - mount_path (required)
    - lifecycle_configuration (block):
        - idle_runtime_session_timeout (optional)
        - max_lifetime (optional)
    - network_configuration (block):
        - network_mode (required)
        - network_mode_config (optional, block):
            - security_groups (required)
            - subnets (required)
    - protocol_configuration (block):
        - server_protocol (optional)
    - request_header_configuration (block):
        - request_header_allowlist (optional)
EOT

  type = map(object({
    agent_runtime_name    = string
    role_arn              = string
    description           = optional(string)
    environment_variables = optional(map(string))
    region                = optional(string)
    tags                  = optional(map(string))
    agent_runtime_artifact = optional(list(object({
      code_configuration = optional(list(object({
        code = optional(list(object({
          s3 = optional(list(object({
            bucket     = string
            prefix     = string
            version_id = optional(string)
          })))
        })))
        entry_point = list(string)
        runtime     = string
      })))
      container_configuration = optional(list(object({
        container_uri = string
      })))
    })))
    authorizer_configuration = optional(list(object({
      custom_jwt_authorizer = optional(list(object({
        allowed_audience = optional(set(string))
        allowed_clients  = optional(set(string))
        allowed_scopes   = optional(set(string))
        allowed_workload_configuration = optional(list(object({
          hosting_environment = optional(list(object({
            arn = string
          })))
          workload_identities = optional(list(string))
        })))
        custom_claim = optional(list(object({
          authorizing_claim_match_value = optional(list(object({
            claim_match_operator = string
            claim_match_value = optional(list(object({
              match_value_string      = optional(string)
              match_value_string_list = optional(set(string))
            })))
          })))
          inbound_token_claim_name       = string
          inbound_token_claim_value_type = string
        })))
        discovery_url = string
        private_endpoint = optional(list(object({
          managed_vpc_resource = optional(list(object({
            endpoint_ip_address_type = string
            routing_domain           = optional(string)
            security_group_ids       = optional(set(string))
            subnet_ids               = set(string)
            tags                     = optional(map(string))
            vpc_identifier           = string
          })))
          self_managed_lattice_resource = optional(list(object({
            resource_configuration_identifier = string
          })))
        })))
        private_endpoint_overrides = optional(list(object({
          domain = string
          private_endpoint = optional(list(object({
            managed_vpc_resource = optional(list(object({
              endpoint_ip_address_type = string
              routing_domain           = optional(string)
              security_group_ids       = optional(set(string))
              subnet_ids               = set(string)
              tags                     = optional(map(string))
              vpc_identifier           = string
            })))
            self_managed_lattice_resource = optional(list(object({
              resource_configuration_identifier = string
            })))
          })))
        })))
      })))
    })))
    filesystem_configuration = optional(list(object({
      efs_access_point = optional(list(object({
        access_point_arn = string
        mount_path       = string
      })))
      s3_files_access_point = optional(list(object({
        access_point_arn = string
        mount_path       = string
      })))
      session_storage = optional(list(object({
        mount_path = string
      })))
    })))
    lifecycle_configuration = optional(list(object({
      idle_runtime_session_timeout = optional(number)
      max_lifetime                 = optional(number)
    })))
    network_configuration = optional(list(object({
      network_mode = string
      network_mode_config = optional(list(object({
        security_groups = set(string)
        subnets         = set(string)
      })))
    })))
    protocol_configuration = optional(list(object({
      server_protocol = optional(string)
    })))
    request_header_configuration = optional(list(object({
      request_header_allowlist = optional(set(string))
    })))
  }))
}

