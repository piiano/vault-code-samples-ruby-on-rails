# PvaultSdk::IAMApi

All URIs are relative to *http://localhost:8123*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_iam_conf**](IAMApi.md#get_iam_conf) | **GET** /api/pvlt/1.0/ctl/iam/conf | Get IAM configuration |
| [**regenerate_user_api_key**](IAMApi.md#regenerate_user_api_key) | **POST** /api/pvlt/1.0/ctl/iam/user/regen | Regenerate user API key |
| [**set_iam_conf**](IAMApi.md#set_iam_conf) | **POST** /api/pvlt/1.0/ctl/iam/conf | Set IAM configuration |


## get_iam_conf

> <AuthConfig> get_iam_conf

Get IAM configuration

Gets the identity and access management (IAM) configuration in TOML format.  The role that performs this operation must have the `CapIAMReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::IAMApi.new

begin
  # Get IAM configuration
  result = api_instance.get_iam_conf
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling IAMApi->get_iam_conf: #{e}"
end
```

#### Using the get_iam_conf_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AuthConfig>, Integer, Hash)> get_iam_conf_with_http_info

```ruby
begin
  # Get IAM configuration
  data, status_code, headers = api_instance.get_iam_conf_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AuthConfig>
rescue PvaultSdk::ApiError => e
  puts "Error when calling IAMApi->get_iam_conf_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AuthConfig**](AuthConfig.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/toml, application/json


## regenerate_user_api_key

> <APIKey> regenerate_user_api_key(user_name)

Regenerate user API key

Regenerates a user's API key. The existing API key is invalidated. This operation is irreversible.  The role that performs this operation must have the `CapIAMWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::IAMApi.new
user_name = PvaultSdk::UserName.new({name: 'name_example'}) # UserName | The name of the user to regenerate API key for.

begin
  # Regenerate user API key
  result = api_instance.regenerate_user_api_key(user_name)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling IAMApi->regenerate_user_api_key: #{e}"
end
```

#### Using the regenerate_user_api_key_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<APIKey>, Integer, Hash)> regenerate_user_api_key_with_http_info(user_name)

```ruby
begin
  # Regenerate user API key
  data, status_code, headers = api_instance.regenerate_user_api_key_with_http_info(user_name)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <APIKey>
rescue PvaultSdk::ApiError => e
  puts "Error when calling IAMApi->regenerate_user_api_key_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_name** | [**UserName**](UserName.md) | The name of the user to regenerate API key for. |  |

### Return type

[**APIKey**](APIKey.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## set_iam_conf

> set_iam_conf(auth_config)

Set IAM configuration

Sets the identity and access management (IAM) configuration.  The role that performs this operation must have the `CapIAMWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::IAMApi.new
auth_config = PvaultSdk::AuthConfig.new({policies: { key: PvaultSdk::AuthPolicy.new({operations: ['operations_example'], policy_type: 'policy_type_example', reasons: ['reasons_example'], resources: ['resources_example']})}, roles: { key: PvaultSdk::AuthRole.new({capabilities: ['capabilities_example'], policies: ['policies_example']})}, users: { key: PvaultSdk::AuthUser.new({disabled: false, role: 'role_example'})}}) # AuthConfig | IAM configuration in TOML format.

begin
  # Set IAM configuration
  api_instance.set_iam_conf(auth_config)
rescue PvaultSdk::ApiError => e
  puts "Error when calling IAMApi->set_iam_conf: #{e}"
end
```

#### Using the set_iam_conf_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> set_iam_conf_with_http_info(auth_config)

```ruby
begin
  # Set IAM configuration
  data, status_code, headers = api_instance.set_iam_conf_with_http_info(auth_config)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling IAMApi->set_iam_conf_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_config** | [**AuthConfig**](AuthConfig.md) | IAM configuration in TOML format. |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/toml
- **Accept**: application/json

