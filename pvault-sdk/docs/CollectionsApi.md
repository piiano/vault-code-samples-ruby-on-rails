# PvaultSdk::CollectionsApi

All URIs are relative to *http://localhost:8123*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**add_collection**](CollectionsApi.md#add_collection) | **POST** /api/pvlt/1.0/ctl/collections | Add collection |
| [**delete_collection**](CollectionsApi.md#delete_collection) | **DELETE** /api/pvlt/1.0/ctl/collections/{collection} | Delete collection |
| [**get_collection**](CollectionsApi.md#get_collection) | **GET** /api/pvlt/1.0/ctl/collections/{collection} | Get collection |
| [**list_collections**](CollectionsApi.md#list_collections) | **GET** /api/pvlt/1.0/ctl/collections | List collections |
| [**update_collection**](CollectionsApi.md#update_collection) | **PATCH** /api/pvlt/1.0/ctl/collections/{collection} | Update collection |


## add_collection

> <Collection> add_collection(collection, opts)

Add collection

Adds a collection.  The collection request can be provided in JSON or PVSchema format by setting the `Content-Type` header to `application/json` or `application/pvschema`, respectively. The collection can be returned in JSON or PVSchema format using the `format` query parameter or by setting the `Accept` header to `application/json` or `application/pvschema`, respectively. The default is to return JSON.  See [PVSchema](/guides/manage-collections-and-schemas/reference/pvschema) for more details on the structure and content of PVSchema.  Invalid optional `properties` attributes in a JSON request are ignored.  The role performing this operation must have the `CapCollectionsWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::CollectionsApi.new
collection = PvaultSdk::Collection.new({name: 'buyers', properties: [PvaultSdk::Property.new({name: 'buyer_name', pii_type_name: 'STRING'})], type: 'PERSONS'}) # Collection | Details of the collection including its properties.
opts = {
  format: 'pvschema', # String | The format of the response. Overrides any `Accept` header value provided.
  options: ['show_builtins'] # Array<String> | Options for the operation. Options include: - `show_builtins` – show built-in properties in the response. 
}

begin
  # Add collection
  result = api_instance.add_collection(collection, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionsApi->add_collection: #{e}"
end
```

#### Using the add_collection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Collection>, Integer, Hash)> add_collection_with_http_info(collection, opts)

```ruby
begin
  # Add collection
  data, status_code, headers = api_instance.add_collection_with_http_info(collection, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Collection>
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionsApi->add_collection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | [**Collection**](Collection.md) | Details of the collection including its properties. |  |
| **format** | **String** | The format of the response. Overrides any &#x60;Accept&#x60; header value provided. | [optional][default to &#39;json&#39;] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;show_builtins&#x60; – show built-in properties in the response.  | [optional] |

### Return type

[**Collection**](Collection.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, application/pvschema
- **Accept**: application/json, application/pvschema


## delete_collection

> delete_collection(collection)

Delete collection

Deletes a collection.  The role that performs this operation must have the `CapCollectionsWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::CollectionsApi.new
collection = 'buyers' # String | The name of the collection.

begin
  # Delete collection
  api_instance.delete_collection(collection)
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionsApi->delete_collection: #{e}"
end
```

#### Using the delete_collection_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_collection_with_http_info(collection)

```ruby
begin
  # Delete collection
  data, status_code, headers = api_instance.delete_collection_with_http_info(collection)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionsApi->delete_collection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection. |  |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_collection

> <Collection> get_collection(collection, opts)

Get collection

Gets a collection and its properties.  The collection details can be returned in JSON or PVSchema format using the `format` query parameter or by setting the `Accept` header to `application/json` or `application/pvschema`, respectively. The default is to return JSON.  See [PVSchema](/guides/manage-collections-and-schemas/reference/pvschema) for more details on the structure and content of PVSchema.  The role that performs this operation must have the `CapCollectionsReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations. 

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::CollectionsApi.new
collection = 'buyers' # String | The name of the collection.
opts = {
  format: 'pvschema', # String | The format of the response. Overrides any `Accept` header value provided.
  options: ['show_builtins'] # Array<String> | Options for the operation. Options include: - `show_builtins` – show built-in properties in the response. 
}

begin
  # Get collection
  result = api_instance.get_collection(collection, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionsApi->get_collection: #{e}"
end
```

#### Using the get_collection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Collection>, Integer, Hash)> get_collection_with_http_info(collection, opts)

```ruby
begin
  # Get collection
  data, status_code, headers = api_instance.get_collection_with_http_info(collection, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Collection>
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionsApi->get_collection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection. |  |
| **format** | **String** | The format of the response. Overrides any &#x60;Accept&#x60; header value provided. | [optional][default to &#39;json&#39;] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;show_builtins&#x60; – show built-in properties in the response.  | [optional] |

### Return type

[**Collection**](Collection.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, application/pvschema


## list_collections

> <Array<Collection>> list_collections(opts)

List collections

Lists all collections.  The collections can be returned in JSON or PVSchema format using the `format` query parameter or by setting the `Accept` header to `application/json` or `application/pvschema`, respectively. The default is to return JSON.  See [PVSchema](/guides/manage-collections-and-schemas/reference/pvschema) for more details on the structure and content of PVSchema.  The PVSchema format for multiple collections is the PVSchema for each collection string concatenated with a newline.  The role that performs this operation must have the `CapCollectionsReader` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations. 

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::CollectionsApi.new
opts = {
  format: 'pvschema', # String | The format of the response. Overrides any `Accept` header value provided.
  options: ['show_builtins'] # Array<String> | Options for the operation. Options include: - `show_builtins` – show built-in properties in the response. 
}

begin
  # List collections
  result = api_instance.list_collections(opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionsApi->list_collections: #{e}"
end
```

#### Using the list_collections_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Collection>>, Integer, Hash)> list_collections_with_http_info(opts)

```ruby
begin
  # List collections
  data, status_code, headers = api_instance.list_collections_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Collection>>
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionsApi->list_collections_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **format** | **String** | The format of the response. Overrides any &#x60;Accept&#x60; header value provided. | [optional][default to &#39;json&#39;] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;show_builtins&#x60; – show built-in properties in the response.  | [optional] |

### Return type

[**Array&lt;Collection&gt;**](Collection.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, application/pvschema


## update_collection

> <Collection> update_collection(collection, collection2, opts)

Update collection

Adds properties to a collection.  The collection request can be provided in JSON or PVSchema format by setting the `Content-Type` header to `application/json` or `application/pvschema`, respectively. The collection can be returned in JSON or PVSchema format using the `format` query parameter or by setting  the  `Accept` header to `application/json` or `application/pvschema`, respectively. The default is to return JSON.  See [PVSchema](/guides/manage-collections-and-schemas/reference/pvschema) for more details on the structure and content of PVSchema.  The collection name provided in the path parameter must match the collection name in the JSON or PVSchema.  The role that performs this operation must have the `CapCollectionsWriter` capability. See [Access control](/data-security/identity-and-access-management#access-control) for more information about how capabilities are used to control access to operations. 

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::CollectionsApi.new
collection = 'buyers' # String | The name of the collection.
collection2 = PvaultSdk::Collection.new({name: 'buyers', properties: [PvaultSdk::Property.new({name: 'buyer_name', pii_type_name: 'STRING'})], type: 'PERSONS'}) # Collection | Details of the collection, including its properties.
opts = {
  format: 'pvschema', # String | The format of the response. Overrides any `Accept` header value provided.
  options: ['show_builtins'] # Array<String> | Options for the operation. Options include: - `show_builtins` – show built-in properties in the response. 
}

begin
  # Update collection
  result = api_instance.update_collection(collection, collection2, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionsApi->update_collection: #{e}"
end
```

#### Using the update_collection_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Collection>, Integer, Hash)> update_collection_with_http_info(collection, collection2, opts)

```ruby
begin
  # Update collection
  data, status_code, headers = api_instance.update_collection_with_http_info(collection, collection2, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Collection>
rescue PvaultSdk::ApiError => e
  puts "Error when calling CollectionsApi->update_collection_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection. |  |
| **collection2** | [**Collection**](Collection.md) | Details of the collection, including its properties. |  |
| **format** | **String** | The format of the response. Overrides any &#x60;Accept&#x60; header value provided. | [optional][default to &#39;json&#39;] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;show_builtins&#x60; – show built-in properties in the response.  | [optional] |

### Return type

[**Collection**](Collection.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json, application/pvschema
- **Accept**: application/json, application/pvschema

