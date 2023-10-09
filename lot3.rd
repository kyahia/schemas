# Network payload
This folder contains :
- An exemple of a post_deployment payload passed to Camunda (as a stringified json) for Post deployment operations;
- A schema v7 for post_deployment payload validation

## JSON arguments
The argument `process_onc_build` has the following properties
| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| client_profile | General information regarding of the client's service order | `object` | yes |
| post_deployment | post_deployment data | `object` | yes |

The property `client_profile` supportes the following:
| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| client_name | name of the client | `string` | yes |
| dedicated_vrf | Whether the client has a dedicated vrf | `boolean` | yes |
| mpls_bte | Whether the client has MPLS BTE | `boolean` | yes |

The property `post_deployment` supportes the following:
| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| vm-gw | data of the vm-gw  of the client | `object` | no |
| devices | List of the devices provisioned in deployment phase | `list` | yes |

The property `devices` supportes the following:
| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| os | Operating system of the device | `string` | yes |
| username | username of the device | `string` | yes |
| ip | IP address of the device | `string` | yes |
| hostname | Hostname of the device | `string` | yes |
| connection_name | name of the connection to the device in RoyalTS | `string` | yes |
| owns_credentials | Whether the device has its own credentials in RoyalTS or it takes the oparent folder credentials | `boolean` | yes |
| probe | WUG probe for the device | `string` | no |
| georedundancy | wherther the device has to be georedunded | `boolean` | yes |
| wug_monitor_name | Name of the custom WUG monitor | `string` | no |
| credentials | List of WAN IP addresses| `object` | no |


The property `credentials` supportes the following:
| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| credential_name | Name of the credential for RoyalTS | `string` | yes |
| authentication | Credential to be used for authentication | `string` | yes |


## Validation
Many libraries of many languages allow the validation of an object against a json schema. In our case, we used the groovy script in the folder "/ScriptTasks/validate_payload.groovy"
