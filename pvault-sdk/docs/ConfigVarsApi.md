# PvaultSdk::ConfigVarsApi

All URIs are relative to *http://localhost:8123*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**clear_all_conf_vars**](ConfigVarsApi.md#clear_all_conf_vars) | **DELETE** /api/pvlt/1.0/system/confvar | Clear configuration variables |
| [**get_conf_var**](ConfigVarsApi.md#get_conf_var) | **GET** /api/pvlt/1.0/system/confvar/{name} | Get configuration variable |
| [**set_conf_var**](ConfigVarsApi.md#set_conf_var) | **POST** /api/pvlt/1.0/system/confvar/{name} | Set configuration variable |


## clear_all_conf_vars

> clear_all_conf_vars

Clear configuration variables

Clears all dynamic configuration variables.  The role performing this operation must have the `CapConfvarWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::ConfigVarsApi.new

begin
  # Clear configuration variables
  api_instance.clear_all_conf_vars
rescue PvaultSdk::ApiError => e
  puts "Error when calling ConfigVarsApi->clear_all_conf_vars: #{e}"
end
```

#### Using the clear_all_conf_vars_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> clear_all_conf_vars_with_http_info

```ruby
begin
  # Clear configuration variables
  data, status_code, headers = api_instance.clear_all_conf_vars_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling ConfigVarsApi->clear_all_conf_vars_with_http_info: #{e}"
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


## get_conf_var

> <ConfVar> get_conf_var(name)

Get configuration variable

Gets a dynamic configuration variable by name. The names of the variables that may be obtained are:  - `log_level`  The role that performs this operation must have the `CapConfvarReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::ConfigVarsApi.new
name = 'name_example' # String | The name of the configuration variable.

begin
  # Get configuration variable
  result = api_instance.get_conf_var(name)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling ConfigVarsApi->get_conf_var: #{e}"
end
```

#### Using the get_conf_var_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConfVar>, Integer, Hash)> get_conf_var_with_http_info(name)

```ruby
begin
  # Get configuration variable
  data, status_code, headers = api_instance.get_conf_var_with_http_info(name)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConfVar>
rescue PvaultSdk::ApiError => e
  puts "Error when calling ConfigVarsApi->get_conf_var_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the configuration variable. |  |

### Return type

[**ConfVar**](ConfVar.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## set_conf_var

> set_conf_var(name, conf_var_value)

Set configuration variable

Sets a dynamic configuration variable by name. The names of the variables that may be set are:  - `log_level` which can take the values of `debug`, `info`, `warn`, and `error`.  The role that performs this operation must have the `CapConfvarWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::ConfigVarsApi.new
name = 'name_example' # String | The name of the configuration variable.
conf_var_value = PvaultSdk::ConfVarValue.new({value: 3.56}) # ConfVarValue | Value of the configuration.

begin
  # Set configuration variable
  api_instance.set_conf_var(name, conf_var_value)
rescue PvaultSdk::ApiError => e
  puts "Error when calling ConfigVarsApi->set_conf_var: #{e}"
end
```

#### Using the set_conf_var_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> set_conf_var_with_http_info(name, conf_var_value)

```ruby
begin
  # Set configuration variable
  data, status_code, headers = api_instance.set_conf_var_with_http_info(name, conf_var_value)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling ConfigVarsApi->set_conf_var_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the configuration variable. |  |
| **conf_var_value** | [**ConfVarValue**](ConfVarValue.md) | Value of the configuration. |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

