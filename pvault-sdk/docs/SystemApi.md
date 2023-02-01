# PvaultSdk::SystemApi

All URIs are relative to *http://localhost:8123*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**control_health**](SystemApi.md#control_health) | **GET** /api/pvlt/1.0/ctl/info/health | Get control service health/status |
| [**data_health**](SystemApi.md#data_health) | **GET** /api/pvlt/1.0/data/info/health | Get data service health/status |
| [**garbage_collection**](SystemApi.md#garbage_collection) | **POST** /api/pvlt/1.0/system/admin/lifecycle/gc | Delete objects and tokens |
| [**get_cluster_info**](SystemApi.md#get_cluster_info) | **GET** /api/pvlt/1.0/ctl/info/cluster | Get cluster information |
| [**get_configuration**](SystemApi.md#get_configuration) | **GET** /api/pvlt/1.0/system/info/configuration | Get system configuration |
| [**get_kms**](SystemApi.md#get_kms) | **GET** /api/pvlt/1.0/system/info/kms | Get KMS status |
| [**get_license**](SystemApi.md#get_license) | **GET** /api/pvlt/1.0/system/info/license | Get license |
| [**get_vault_version**](SystemApi.md#get_vault_version) | **GET** /api/pvlt/1.0/system/info/version | Get Vault version |
| [**rotate_keys**](SystemApi.md#rotate_keys) | **POST** /api/pvlt/1.0/system/admin/keys/rotate | Rotate data encryption keys |
| [**trigger_error**](SystemApi.md#trigger_error) | **POST** /api/pvlt/1.0/system/debug/error/trigger | Trigger an artificial error |


## control_health

> <Health> control_health

Get control service health/status

Gets the status of the service.  The status codes returned follow the IETF standard [Health Check Response Format for HTTP APIs](https://datatracker.ietf.org/doc/html/draft-inadarei-api-health-check-05). For example, `pass` is returned when the service is up.

### Examples

```ruby
require 'time'
require 'pvault-sdk'

api_instance = PvaultSdk::SystemApi.new

begin
  # Get control service health/status
  result = api_instance.control_health
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->control_health: #{e}"
end
```

#### Using the control_health_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Health>, Integer, Hash)> control_health_with_http_info

```ruby
begin
  # Get control service health/status
  data, status_code, headers = api_instance.control_health_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Health>
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->control_health_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Health**](Health.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## data_health

> <Health> data_health

Get data service health/status

Gets the status of the service.  The status codes returned follow the IETF standard [Health Check Response Format for HTTP APIs](https://datatracker.ietf.org/doc/html/draft-inadarei-api-health-check-05). For example, `pass` is returned when the service is up.  The role performing this operation must have the `CapDataReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'

api_instance = PvaultSdk::SystemApi.new

begin
  # Get data service health/status
  result = api_instance.data_health
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->data_health: #{e}"
end
```

#### Using the data_health_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Health>, Integer, Hash)> data_health_with_http_info

```ruby
begin
  # Get data service health/status
  data, status_code, headers = api_instance.data_health_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Health>
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->data_health_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Health**](Health.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## garbage_collection

> <Array<GcDeletionCount>> garbage_collection(reason, opts)

Delete objects and tokens

Deletes archived objects and tokens that have been archived for longer than the retention period.  See [Object life cycle](/data-privacy/object-lifecycle) for more information on how objects and tokens are archived and how deletion is affected by the retention period. 

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::SystemApi.new
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
opts = {
  filter: 'objects_only', # String | Whether to delete objects, tokens, or both. Options are: - `objects_only` – delete only objects. - `tokens_only` – delete only tokens. If not set, the default is both. 
  dry_run: true, # Boolean | Whether to respond with how many objects and tokens are available for deletion, without deleting them.
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true # Boolean | Reloads the cache before the action.
}

begin
  # Delete objects and tokens
  result = api_instance.garbage_collection(reason, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->garbage_collection: #{e}"
end
```

#### Using the garbage_collection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<GcDeletionCount>>, Integer, Hash)> garbage_collection_with_http_info(reason, opts)

```ruby
begin
  # Delete objects and tokens
  data, status_code, headers = api_instance.garbage_collection_with_http_info(reason, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<GcDeletionCount>>
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->garbage_collection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **filter** | **String** | Whether to delete objects, tokens, or both. Options are: - &#x60;objects_only&#x60; – delete only objects. - &#x60;tokens_only&#x60; – delete only tokens. If not set, the default is both.  | [optional] |
| **dry_run** | **Boolean** | Whether to respond with how many objects and tokens are available for deletion, without deleting them. | [optional][default to false] |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |

### Return type

[**Array&lt;GcDeletionCount&gt;**](GcDeletionCount.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_cluster_info

> <AllGenerations> get_cluster_info

Get cluster information

Get Cluster Information.  Returns the vault's generation and the generations of all the workers (data servers).  The role that performs this operation must have the `CapClusterInfoReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::SystemApi.new

begin
  # Get cluster information
  result = api_instance.get_cluster_info
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->get_cluster_info: #{e}"
end
```

#### Using the get_cluster_info_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AllGenerations>, Integer, Hash)> get_cluster_info_with_http_info

```ruby
begin
  # Get cluster information
  data, status_code, headers = api_instance.get_cluster_info_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AllGenerations>
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->get_cluster_info_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AllGenerations**](AllGenerations.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_configuration

> <ConfigConfig> get_configuration

Get system configuration

Get the current active system configuration.  The role that performs this operation must have the `CapInfoReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::SystemApi.new

begin
  # Get system configuration
  result = api_instance.get_configuration
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->get_configuration: #{e}"
end
```

#### Using the get_configuration_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConfigConfig>, Integer, Hash)> get_configuration_with_http_info

```ruby
begin
  # Get system configuration
  data, status_code, headers = api_instance.get_configuration_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConfigConfig>
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->get_configuration_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ConfigConfig**](ConfigConfig.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/toml, application/json


## get_kms

> <KMSStatus> get_kms

Get KMS status

Gets the status of the configured KMS.  The role that performs this operation must have the `CapKMSReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::SystemApi.new

begin
  # Get KMS status
  result = api_instance.get_kms
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->get_kms: #{e}"
end
```

#### Using the get_kms_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<KMSStatus>, Integer, Hash)> get_kms_with_http_info

```ruby
begin
  # Get KMS status
  data, status_code, headers = api_instance.get_kms_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <KMSStatus>
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->get_kms_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**KMSStatus**](KMSStatus.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_license

> <License> get_license

Get license

Gets information on the currently used license.  The role that performs this operation must have the `CapInfoReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::SystemApi.new

begin
  # Get license
  result = api_instance.get_license
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->get_license: #{e}"
end
```

#### Using the get_license_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<License>, Integer, Hash)> get_license_with_http_info

```ruby
begin
  # Get license
  data, status_code, headers = api_instance.get_license_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <License>
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->get_license_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**License**](License.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_vault_version

> <ProductVersion> get_vault_version

Get Vault version

Gets the version of Vault.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::SystemApi.new

begin
  # Get Vault version
  result = api_instance.get_vault_version
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->get_vault_version: #{e}"
end
```

#### Using the get_vault_version_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ProductVersion>, Integer, Hash)> get_vault_version_with_http_info

```ruby
begin
  # Get Vault version
  data, status_code, headers = api_instance.get_vault_version_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ProductVersion>
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->get_vault_version_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ProductVersion**](ProductVersion.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## rotate_keys

> rotate_keys

Rotate data encryption keys

Rotates all the KMS keys that Vault uses to encrypt properties, tokens, and more.  When the keys are rotated, new data is encrypted with the new key. All old keys are retained, so that content encrypted with previous keys can be decipherable.  The role that performs this operation must have the `CapKMSWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::SystemApi.new

begin
  # Rotate data encryption keys
  api_instance.rotate_keys
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->rotate_keys: #{e}"
end
```

#### Using the rotate_keys_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> rotate_keys_with_http_info

```ruby
begin
  # Rotate data encryption keys
  data, status_code, headers = api_instance.rotate_keys_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->rotate_keys_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## trigger_error

> trigger_error

Trigger an artificial error

Manually trigger an artificial error for testing purposes.  The role that performs this operation must have the `CapErrorWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::SystemApi.new

begin
  # Trigger an artificial error
  api_instance.trigger_error
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->trigger_error: #{e}"
end
```

#### Using the trigger_error_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> trigger_error_with_http_info

```ruby
begin
  # Trigger an artificial error
  data, status_code, headers = api_instance.trigger_error_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling SystemApi->trigger_error_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

