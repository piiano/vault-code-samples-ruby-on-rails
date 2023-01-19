# PvaultSdk::ObjectsApi

All URIs are relative to *http://localhost:8123*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**add_object**](ObjectsApi.md#add_object) | **POST** /api/pvlt/1.0/data/collections/{collection}/objects | Add object |
| [**delete_object_by_id**](ObjectsApi.md#delete_object_by_id) | **DELETE** /api/pvlt/1.0/data/collections/{collection}/objects | Delete object |
| [**get_objects_property**](ObjectsApi.md#get_objects_property) | **GET** /api/pvlt/1.0/data/collections/{collection}/properties/{property} | Get objects property |
| [**list_objects**](ObjectsApi.md#list_objects) | **GET** /api/pvlt/1.0/data/collections/{collection}/objects | List objects |
| [**search_objects**](ObjectsApi.md#search_objects) | **POST** /api/pvlt/1.0/data/collections/{collection}/query/objects | Search objects |
| [**update_object_by_id**](ObjectsApi.md#update_object_by_id) | **PATCH** /api/pvlt/1.0/data/collections/{collection}/objects | Update object |


## add_object

> <ObjectID> add_object(collection, reason, request_body, opts)

Add object

Adds an object to a collection. The request must include all the non-nullable properties, as defined by the [collection schema](/api/operations/list-collection-properties).  The role performing this operation must have both of the following: - The `CapDataWriter` capability. - At least one allowing policy and no denying policies for the `write` operation for each of the collection properties   provided in the call.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::ObjectsApi.new
collection = 'collection_example' # String | The name of the collection to add the object to.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
request_body = { key: 3.56} # Hash<String, Object> | The object details.
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  expiration_secs: 'expiration_secs_example' # String | Object expiration time in seconds, cannot be set to 0. If not set, the default value is used. See the `PVAULT_EXPIRATION_ASSOCIATED_OBJECTS` and `PVAULT_EXPIRATION_UNASSOCIATED_OBJECTS` environment variables.
}

begin
  # Add object
  result = api_instance.add_object(collection, reason, request_body, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->add_object: #{e}"
end
```

#### Using the add_object_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ObjectID>, Integer, Hash)> add_object_with_http_info(collection, reason, request_body, opts)

```ruby
begin
  # Add object
  data, status_code, headers = api_instance.add_object_with_http_info(collection, reason, request_body, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ObjectID>
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->add_object_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection to add the object to. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) | The object details. |  |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |
| **expiration_secs** | **String** | Object expiration time in seconds, cannot be set to 0. If not set, the default value is used. See the &#x60;PVAULT_EXPIRATION_ASSOCIATED_OBJECTS&#x60; and &#x60;PVAULT_EXPIRATION_UNASSOCIATED_OBJECTS&#x60; environment variables. | [optional] |

### Return type

[**ObjectID**](ObjectID.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_object_by_id

> delete_object_by_id(collection, ids, reason, opts)

Delete object

Deletes an object from a collection. This operation is irreversible.  The role performing this operation must have both of the following: - The `CapDataWriter` capability. - At least one allowing policy and no denying policies for the `delete` operation for each of the properties defined for   the collection specified in the call.     See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::ObjectsApi.new
collection = 'collection_example' # String | The name of the collection containing the object.
ids = ['inner_example'] # Array<String> | A comma-separated list of object IDs.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
opts = {
  options: ['inner_example'], # Array<String> | Options for the operation. Options include: - `archived` – whether to delete only archived objects. If not specified, delete only active objects. 
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true # Boolean | Reloads the cache before the action.
}

begin
  # Delete object
  api_instance.delete_object_by_id(collection, ids, reason, opts)
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->delete_object_by_id: #{e}"
end
```

#### Using the delete_object_by_id_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_object_by_id_with_http_info(collection, ids, reason, opts)

```ruby
begin
  # Delete object
  data, status_code, headers = api_instance.delete_object_by_id_with_http_info(collection, ids, reason, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->delete_object_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the object. |  |
| **ids** | [**Array&lt;String&gt;**](String.md) | A comma-separated list of object IDs. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;archived&#x60; – whether to delete only archived objects. If not specified, delete only active objects.  | [optional] |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_objects_property

> <ObjectFieldsPage> get_objects_property(reason, collection, property, opts)

Get objects property

Returns a [paginated list](/api/api-pagination) of the values of a property for objects in a collection.  The role performing this operation must have both of the following: - The `CapDataReader` capability. - At least one allowing policy and no denying policies for the `read` operation for the property and the and the   collection requested in the call.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::ObjectsApi.new
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
collection = 'collection_example' # String | The name of the collection containing the objects.
property = 'property_example' # String | The required property.
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  page_size: 56, # Integer | The maximum number of items to return in this request. If not specified, the default value is used. The default value is the value specified in the environment variable `PVAULT_SERVICE_DEFAULT_PAGE_SIZE`. The value must not exceed the value specified in the environment variable `PVAULT_SERVICE_DEFAULT_PAGE_SIZE`
  cursor: 'cursor_example', # String | The cursor represents the state of consecutive queries for the same request parameters. In the first call, the cursor may be omitted or specified as an empty string. In consecutive calls, it should be set to the value of the cursor field of the objectFieldsPage returned by the previous call. Note: when the `id` is specified, paging is not supported. In this case, if the number of `id` values specified exceeds the maximum page size, the method returns 400 (BAD REQUEST).
  x_trans_param: 'x_trans_param_example', # String | Extra parameter to pass on to the transformations.
  options: ['inner_example'], # Array<String> | Options for the operation. Options include: - `archived` – whether to get only archived objects. If not specified, get only active objects. 
  ids: ['inner_example'] # Array<String> | A comma-separated list of object IDs
}

begin
  # Get objects property
  result = api_instance.get_objects_property(reason, collection, property, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->get_objects_property: #{e}"
end
```

#### Using the get_objects_property_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ObjectFieldsPage>, Integer, Hash)> get_objects_property_with_http_info(reason, collection, property, opts)

```ruby
begin
  # Get objects property
  data, status_code, headers = api_instance.get_objects_property_with_http_info(reason, collection, property, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ObjectFieldsPage>
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->get_objects_property_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **property** | **String** | The required property. |  |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |
| **page_size** | **Integer** | The maximum number of items to return in this request. If not specified, the default value is used. The default value is the value specified in the environment variable &#x60;PVAULT_SERVICE_DEFAULT_PAGE_SIZE&#x60;. The value must not exceed the value specified in the environment variable &#x60;PVAULT_SERVICE_DEFAULT_PAGE_SIZE&#x60; | [optional] |
| **cursor** | **String** | The cursor represents the state of consecutive queries for the same request parameters. In the first call, the cursor may be omitted or specified as an empty string. In consecutive calls, it should be set to the value of the cursor field of the objectFieldsPage returned by the previous call. Note: when the &#x60;id&#x60; is specified, paging is not supported. In this case, if the number of &#x60;id&#x60; values specified exceeds the maximum page size, the method returns 400 (BAD REQUEST). | [optional] |
| **x_trans_param** | **String** | Extra parameter to pass on to the transformations. | [optional] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;archived&#x60; – whether to get only archived objects. If not specified, get only active objects.  | [optional] |
| **ids** | [**Array&lt;String&gt;**](String.md) | A comma-separated list of object IDs | [optional] |

### Return type

[**ObjectFieldsPage**](ObjectFieldsPage.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_objects

> <ObjectFieldsPage> list_objects(collection, reason, opts)

List objects

Returns a [paginated list](/api/api-pagination) of objects from a collection with all or a subset of object property values.  The role performing this operation must have both of the following: - The `CapDataReader` capability. - At least one allowing policy and no denying policies for the `read` operation for each of the properties and the   collection requested in the call.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data.  **Warning**: Use of the `unsafe` option, to include all object property values, may expose more private information than is required, use with caution.

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::ObjectsApi.new
collection = 'collection_example' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  page_size: 56, # Integer | The maximum number of items to return in this request. If not specified, the default value is used. The default value is the value specified in the environment variable `PVAULT_SERVICE_DEFAULT_PAGE_SIZE`. The value must not exceed the value specified in the environment variable `PVAULT_SERVICE_DEFAULT_PAGE_SIZE`
  cursor: 'cursor_example', # String | The cursor represents the state of consecutive queries for the same request parameters. In the first call, the cursor may be omitted or specified as an empty string. In consecutive calls, it should be set to the value of the cursor field of the objectFieldsPage returned by the previous call. Note: when the `id` is specified, paging is not supported. In this case, if the number of `id` values specified exceeds the maximum page size, the method returns 400 (BAD REQUEST).
  x_trans_param: 'x_trans_param_example', # String | Extra parameter to pass on to the transformations.
  ids: ['inner_example'], # Array<String> | A comma-separated list of object IDs
  options: ['inner_example'], # Array<String> | Options for the operation. Options include: - `unsafe` – fetch all the properties, cannot be specified with `props`. - `show_builtins` – show built-in properties, can only be specified with `unsafe`. - `archived` – whether to list only archived objects. If not specified, list only active objects. 
  props: ['inner_example'] # Array<String> | The list of property names and transformations. To include multiple names and transformation bindings, provide a comma-separated list. For example, `props=first_name,last_name`. If the `unsafe` option is used, must be empty.
}

begin
  # List objects
  result = api_instance.list_objects(collection, reason, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->list_objects: #{e}"
end
```

#### Using the list_objects_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ObjectFieldsPage>, Integer, Hash)> list_objects_with_http_info(collection, reason, opts)

```ruby
begin
  # List objects
  data, status_code, headers = api_instance.list_objects_with_http_info(collection, reason, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ObjectFieldsPage>
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->list_objects_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |
| **page_size** | **Integer** | The maximum number of items to return in this request. If not specified, the default value is used. The default value is the value specified in the environment variable &#x60;PVAULT_SERVICE_DEFAULT_PAGE_SIZE&#x60;. The value must not exceed the value specified in the environment variable &#x60;PVAULT_SERVICE_DEFAULT_PAGE_SIZE&#x60; | [optional] |
| **cursor** | **String** | The cursor represents the state of consecutive queries for the same request parameters. In the first call, the cursor may be omitted or specified as an empty string. In consecutive calls, it should be set to the value of the cursor field of the objectFieldsPage returned by the previous call. Note: when the &#x60;id&#x60; is specified, paging is not supported. In this case, if the number of &#x60;id&#x60; values specified exceeds the maximum page size, the method returns 400 (BAD REQUEST). | [optional] |
| **x_trans_param** | **String** | Extra parameter to pass on to the transformations. | [optional] |
| **ids** | [**Array&lt;String&gt;**](String.md) | A comma-separated list of object IDs | [optional] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;unsafe&#x60; – fetch all the properties, cannot be specified with &#x60;props&#x60;. - &#x60;show_builtins&#x60; – show built-in properties, can only be specified with &#x60;unsafe&#x60;. - &#x60;archived&#x60; – whether to list only archived objects. If not specified, list only active objects.  | [optional] |
| **props** | [**Array&lt;String&gt;**](String.md) | The list of property names and transformations. To include multiple names and transformation bindings, provide a comma-separated list. For example, &#x60;props&#x3D;first_name,last_name&#x60;. If the &#x60;unsafe&#x60; option is used, must be empty. | [optional] |

### Return type

[**ObjectFieldsPage**](ObjectFieldsPage.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_objects

> <ObjectFieldsPage> search_objects(collection, reason, query, opts)

Search objects

Returns a [paginated list](/api/api-pagination) of objects, with property values, from a collection that satisfies a query.  The role performing this operation must have all the following: - The `CapDataSearcher` capability. - Policies:   + At least one allowing policy and no denying policies for the `read` operation for each of the collection properties     specified in the `props` query parameter.   + At least one allowing policy and no denying policies for the `search` operation for each of the collection     properties     specified in the `query` body parameter.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data.  **Warning**: Use of the `unsafe` option, to include all object property values, may expose more private information than is required, use with caution..

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::ObjectsApi.new
collection = 'collection_example' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
query = PvaultSdk::Query.new({match: { key: 3.56}}) # Query | The query. This is a JSON object consisting of property keys and match values. For example: ```json {   \"match\": {     \"first_name\": \"John\",     \"last_name\": \"Doe\"   } } ``` is the equivalent to: ```sql where first_name = \"John\" AND last_name=\"Doe\" ``` 
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  page_size: 56, # Integer | The maximum number of items to return in this request. If not specified, the default value is used. The default value is the value specified in the environment variable `PVAULT_SERVICE_DEFAULT_PAGE_SIZE`. The value must not exceed the value specified in the environment variable `PVAULT_SERVICE_DEFAULT_PAGE_SIZE`
  cursor: 'cursor_example', # String | The cursor represents the state of consecutive queries for the same request parameters. In the first call, the cursor may be omitted or specified as an empty string. In consecutive calls, it should be set to the value of the cursor field of the objectFieldsPage returned by the previous call. Note: when the `id` is specified, paging is not supported. In this case, if the number of `id` values specified exceeds the maximum page size, the method returns 400 (BAD REQUEST).
  x_trans_param: 'x_trans_param_example', # String | Extra parameter to pass on to the transformations.
  options: ['inner_example'], # Array<String> | Options for the operation. Options include: - `unsafe` – fetch all the properties, cannot be specified with `props`. - `show_builtins` – show built-in properties, can only be specified with `unsafe`. - `archived` – whether to search only archived objects. If not specified, search only active objects. 
  props: ['inner_example'] # Array<String> | The list of property names and transformations. To include multiple names and transformation bindings, provide a comma-separated list. For example, `props=first_name,last_name`. If the `unsafe` option is used, must be empty.
}

begin
  # Search objects
  result = api_instance.search_objects(collection, reason, query, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->search_objects: #{e}"
end
```

#### Using the search_objects_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ObjectFieldsPage>, Integer, Hash)> search_objects_with_http_info(collection, reason, query, opts)

```ruby
begin
  # Search objects
  data, status_code, headers = api_instance.search_objects_with_http_info(collection, reason, query, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ObjectFieldsPage>
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->search_objects_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **query** | [**Query**](Query.md) | The query. This is a JSON object consisting of property keys and match values. For example: &#x60;&#x60;&#x60;json {   \&quot;match\&quot;: {     \&quot;first_name\&quot;: \&quot;John\&quot;,     \&quot;last_name\&quot;: \&quot;Doe\&quot;   } } &#x60;&#x60;&#x60; is the equivalent to: &#x60;&#x60;&#x60;sql where first_name &#x3D; \&quot;John\&quot; AND last_name&#x3D;\&quot;Doe\&quot; &#x60;&#x60;&#x60;  |  |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |
| **page_size** | **Integer** | The maximum number of items to return in this request. If not specified, the default value is used. The default value is the value specified in the environment variable &#x60;PVAULT_SERVICE_DEFAULT_PAGE_SIZE&#x60;. The value must not exceed the value specified in the environment variable &#x60;PVAULT_SERVICE_DEFAULT_PAGE_SIZE&#x60; | [optional] |
| **cursor** | **String** | The cursor represents the state of consecutive queries for the same request parameters. In the first call, the cursor may be omitted or specified as an empty string. In consecutive calls, it should be set to the value of the cursor field of the objectFieldsPage returned by the previous call. Note: when the &#x60;id&#x60; is specified, paging is not supported. In this case, if the number of &#x60;id&#x60; values specified exceeds the maximum page size, the method returns 400 (BAD REQUEST). | [optional] |
| **x_trans_param** | **String** | Extra parameter to pass on to the transformations. | [optional] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;unsafe&#x60; – fetch all the properties, cannot be specified with &#x60;props&#x60;. - &#x60;show_builtins&#x60; – show built-in properties, can only be specified with &#x60;unsafe&#x60;. - &#x60;archived&#x60; – whether to search only archived objects. If not specified, search only active objects.  | [optional] |
| **props** | [**Array&lt;String&gt;**](String.md) | The list of property names and transformations. To include multiple names and transformation bindings, provide a comma-separated list. For example, &#x60;props&#x3D;first_name,last_name&#x60;. If the &#x60;unsafe&#x60; option is used, must be empty. | [optional] |

### Return type

[**ObjectFieldsPage**](ObjectFieldsPage.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_object_by_id

> update_object_by_id(collection, ids, reason, request_body, opts)

Update object

Updates properties of an object in a collection.  The role performing this operation must have both of the following: - The `CapDataWriter` capability. - At least one allowing policy and no denying policies for the `write` operation for each of the collection properties   specified in the call.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data. 

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::ObjectsApi.new
collection = 'collection_example' # String | The name of the collection containing the object.
ids = ['inner_example'] # Array<String> | A comma-separated list of object IDs
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
request_body = { key: 3.56} # Hash<String, Object> | The object properties to update.
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  expiration_secs: 'expiration_secs_example', # String | Object expiration time in seconds. If not set, the default is used. See the `PVAULT_EXPIRATION_ASSOCIATED_OBJECTS` and `PVAULT_EXPIRATION_UNASSOCIATED_OBJECTS` environment variables.
  options: ['inner_example'] # Array<String> | Options for the operation. Options include: - `archived` – whether to update only archived objects. If not specified, update only active objects. 
}

begin
  # Update object
  api_instance.update_object_by_id(collection, ids, reason, request_body, opts)
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->update_object_by_id: #{e}"
end
```

#### Using the update_object_by_id_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_object_by_id_with_http_info(collection, ids, reason, request_body, opts)

```ruby
begin
  # Update object
  data, status_code, headers = api_instance.update_object_by_id_with_http_info(collection, ids, reason, request_body, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->update_object_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the object. |  |
| **ids** | [**Array&lt;String&gt;**](String.md) | A comma-separated list of object IDs |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) | The object properties to update. |  |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |
| **expiration_secs** | **String** | Object expiration time in seconds. If not set, the default is used. See the &#x60;PVAULT_EXPIRATION_ASSOCIATED_OBJECTS&#x60; and &#x60;PVAULT_EXPIRATION_UNASSOCIATED_OBJECTS&#x60; environment variables. | [optional] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;archived&#x60; – whether to update only archived objects. If not specified, update only active objects.  | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

