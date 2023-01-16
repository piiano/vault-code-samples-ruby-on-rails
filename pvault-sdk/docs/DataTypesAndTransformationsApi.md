# PvaultSdk::DataTypesAndTransformationsApi

All URIs are relative to *http://localhost:8123*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**list_data_types**](DataTypesAndTransformationsApi.md#list_data_types) | **GET** /api/pvlt/1.0/ctl/types | List property types |
| [**list_transformations**](DataTypesAndTransformationsApi.md#list_transformations) | **GET** /api/pvlt/1.0/ctl/transformations | List transformations |


## list_data_types

> <Array<PIIType>> list_data_types

List property types

Lists the Vault property types.  See Data types for more information.  The role that performs this operation must have the `CapSchemaReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::DataTypesAndTransformationsApi.new

begin
  # List property types
  result = api_instance.list_data_types
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling DataTypesAndTransformationsApi->list_data_types: #{e}"
end
```

#### Using the list_data_types_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<PIIType>>, Integer, Hash)> list_data_types_with_http_info

```ruby
begin
  # List property types
  data, status_code, headers = api_instance.list_data_types_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<PIIType>>
rescue PvaultSdk::ApiError => e
  puts "Error when calling DataTypesAndTransformationsApi->list_data_types_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;PIIType&gt;**](PIIType.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_transformations

> <Array<Transformation>> list_transformations

List transformations

Lists the transformations in a collection. See Manage transformations for more information.  The role that performs this operation must have the `CapSchemaReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::DataTypesAndTransformationsApi.new

begin
  # List transformations
  result = api_instance.list_transformations
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling DataTypesAndTransformationsApi->list_transformations: #{e}"
end
```

#### Using the list_transformations_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Transformation>>, Integer, Hash)> list_transformations_with_http_info

```ruby
begin
  # List transformations
  data, status_code, headers = api_instance.list_transformations_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Transformation>>
rescue PvaultSdk::ApiError => e
  puts "Error when calling DataTypesAndTransformationsApi->list_transformations_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**Array&lt;Transformation&gt;**](Transformation.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

