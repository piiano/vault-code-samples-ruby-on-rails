# PvaultSdk::CollectionPropertiesApi

All URIs are relative to *http://localhost:8123*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**add_collection_property**](CollectionPropertiesApi.md#add_collection_property) | **POST** /api/pvlt/1.0/ctl/collections/{collection}/properties/{property} | Add collection property |
| [**delete_collection_property**](CollectionPropertiesApi.md#delete_collection_property) | **DELETE** /api/pvlt/1.0/ctl/collections/{collection}/properties/{property} | Delete collection property |
| [**get_collection_property**](CollectionPropertiesApi.md#get_collection_property) | **GET** /api/pvlt/1.0/ctl/collections/{collection}/properties/{property} | Get collection property |
| [**list_collection_properties**](CollectionPropertiesApi.md#list_collection_properties) | **GET** /api/pvlt/1.0/ctl/collections/{collection}/properties | List collection properties |
| [**update_collection_property**](CollectionPropertiesApi.md#update_collection_property) | **PATCH** /api/pvlt/1.0/ctl/collections/{collection}/properties/{property} | Update collection property |


## add_collection_property

> <Property> add_collection_property(collection, property, property2)

Add collection property

Adds a property to a collection.  The property name provided in the `property` parameter and request body must match. When the collection contains objects, only nullable properties can be added to the collection.  The role performing this operation must have the `CapCollectionsWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::CollectionPropertiesApi.new
collection = 'buyers' # String | The name of the collection to add the property to.
property = 'buyer_phone' # String | The name of the property to add.
property2 = PvaultSdk::Property.new({name: 'buyer_name', pii_type_name: 'STRING'}) # Property | Details of the property.

begin
  # Add collection property
  result = api_instance.add_collection_property(collection, property, property2)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionPropertiesApi->add_collection_property: #{e}"
end
```

#### Using the add_collection_property_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Property>, Integer, Hash)> add_collection_property_with_http_info(collection, property, property2)

```ruby
begin
  # Add collection property
  data, status_code, headers = api_instance.add_collection_property_with_http_info(collection, property, property2)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Property>
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionPropertiesApi->add_collection_property_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection to add the property to. |  |
| **property** | **String** | The name of the property to add. |  |
| **property2** | [**Property**](Property.md) | Details of the property. |  |

### Return type

[**Property**](Property.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_collection_property

> delete_collection_property(collection, property)

Delete collection property

Deletes a property from a collection.  Any values stored against the property in objects are also deleted. This operation is irreversible.  The role that performs this operation must have the `CapCollectionsWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::CollectionPropertiesApi.new
collection = 'buyers' # String | The name of the collection containing the property.
property = 'buyer_phone' # String | The name of the property.

begin
  # Delete collection property
  api_instance.delete_collection_property(collection, property)
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionPropertiesApi->delete_collection_property: #{e}"
end
```

#### Using the delete_collection_property_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_collection_property_with_http_info(collection, property)

```ruby
begin
  # Delete collection property
  data, status_code, headers = api_instance.delete_collection_property_with_http_info(collection, property)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionPropertiesApi->delete_collection_property_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the property. |  |
| **property** | **String** | The name of the property. |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_collection_property

> <Property> get_collection_property(collection, property)

Get collection property

Gets a property of a collection.  The role that performs this operation must have the `CapCollectionsReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::CollectionPropertiesApi.new
collection = 'buyers' # String | The name of the collection containing the property.
property = 'buyer_name' # String | The name of the property.

begin
  # Get collection property
  result = api_instance.get_collection_property(collection, property)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionPropertiesApi->get_collection_property: #{e}"
end
```

#### Using the get_collection_property_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Property>, Integer, Hash)> get_collection_property_with_http_info(collection, property)

```ruby
begin
  # Get collection property
  data, status_code, headers = api_instance.get_collection_property_with_http_info(collection, property)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Property>
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionPropertiesApi->get_collection_property_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the property. |  |
| **property** | **String** | The name of the property. |  |

### Return type

[**Property**](Property.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_collection_properties

> <Array<Property>> list_collection_properties(collection, opts)

List collection properties

Lists the properties of a collection.  The role that performs this operation must have the `CapCollectionsReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::CollectionPropertiesApi.new
collection = 'buyers' # String | The name of the collection containing the properties.
opts = {
  options: ['show_builtins'] # Array<String> | Options for the operation. Options include:  - `show_builtins` – show built-in properties in the response. 
}

begin
  # List collection properties
  result = api_instance.list_collection_properties(collection, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionPropertiesApi->list_collection_properties: #{e}"
end
```

#### Using the list_collection_properties_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Property>>, Integer, Hash)> list_collection_properties_with_http_info(collection, opts)

```ruby
begin
  # List collection properties
  data, status_code, headers = api_instance.list_collection_properties_with_http_info(collection, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Property>>
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionPropertiesApi->list_collection_properties_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the properties. |  |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include:  - &#x60;show_builtins&#x60; – show built-in properties in the response.  | [optional] |

### Return type

[**Array&lt;Property&gt;**](Property.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_collection_property

> update_collection_property(collection, property, property2)

Update collection property

** Not implemented **  Updates a property of a collection. Properties with values on objects in the collection cannot be updated. Any property not included in the request is replaced with its default values.  The role that performs this operation must have the `CapCollectionsWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::CollectionPropertiesApi.new
collection = 'buyers' # String | The name of the collection containing the property.
property = 'buyer_phone' # String | The name of the property.
property2 = PvaultSdk::Property.new({name: 'buyer_name', pii_type_name: 'STRING'}) # Property | property info

begin
  # Update collection property
  api_instance.update_collection_property(collection, property, property2)
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionPropertiesApi->update_collection_property: #{e}"
end
```

#### Using the update_collection_property_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_collection_property_with_http_info(collection, property, property2)

```ruby
begin
  # Update collection property
  data, status_code, headers = api_instance.update_collection_property_with_http_info(collection, property, property2)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionPropertiesApi->update_collection_property_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the property. |  |
| **property** | **String** | The name of the property. |  |
| **property2** | [**Property**](Property.md) | property info |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

