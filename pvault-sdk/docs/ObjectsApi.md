# PvaultSdk::ObjectsApi

All URIs are relative to *http://localhost:8123*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**add_object**](ObjectsApi.md#add_object) | **POST** /api/pvlt/1.0/data/collections/{collection}/objects | Add object |
| [**add_objects**](ObjectsApi.md#add_objects) | **POST** /api/pvlt/1.0/data/collections/{collection}/bulk/objects | Add objects (bulk) |
| [**delete_object_by_id**](ObjectsApi.md#delete_object_by_id) | **DELETE** /api/pvlt/1.0/data/collections/{collection}/objects/{id} | Delete object |
| [**delete_objects**](ObjectsApi.md#delete_objects) | **DELETE** /api/pvlt/1.0/data/collections/{collection}/bulk/objects | Delete objects (bulk) |
| [**get_object_by_id**](ObjectsApi.md#get_object_by_id) | **GET** /api/pvlt/1.0/data/collections/{collection}/objects/{id} | Get object |
| [**hash_objects**](ObjectsApi.md#hash_objects) | **POST** /api/pvlt/1.0/data/collections/{collection}/hash/objects | Hash objects |
| [**list_objects**](ObjectsApi.md#list_objects) | **GET** /api/pvlt/1.0/data/collections/{collection}/objects | List objects |
| [**search_objects**](ObjectsApi.md#search_objects) | **POST** /api/pvlt/1.0/data/collections/{collection}/query/objects | Search objects |
| [**update_object_by_id**](ObjectsApi.md#update_object_by_id) | **PATCH** /api/pvlt/1.0/data/collections/{collection}/objects/{id} | Update object |
| [**update_objects**](ObjectsApi.md#update_objects) | **PATCH** /api/pvlt/1.0/data/collections/{collection}/bulk/objects | Update objects (bulk) |


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
collection = 'buyers' # String | The name of the collection to add the object to.
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


## add_objects

> <BulkObjectResponse> add_objects(collection, reason, request_body, opts)

Add objects (bulk)

Adds objects to a collection. The request must include all the non-nullable properties for each object, as defined by the collection schema. Use the [list collection properties](/api/operations/list-collection-properties) operation to check the collection schema.  If any object add fails, the operation fails and no objects are added.  The maximum number of objects that can be deleted in one operation is determined by the [`PVAULT_SERVICE_MAX_PAGE_SIZE` environment variable](/guides/configure/environment-variables#service-and-features).  See the [add object](/api/operations/add-object) operation to add an object to a collection.  The role performing this operation must have both of the following: - The `CapDataWriter` capability. - For each object in the request, at least one allowing policy and no denying policies for the `write` operation for each object property.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data. 

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
collection = 'buyers' # String | The name of the collection to add the objects to.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
request_body = [{ key: 3.56}] # Array<Hash> | List of objects to add. The order of the objects in this array is preserved in the response. 
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  expiration_secs: 'expiration_secs_example' # String | Object expiration time in seconds, cannot be set to 0. If not set, the default value is used. See the `PVAULT_EXPIRATION_ASSOCIATED_OBJECTS` and `PVAULT_EXPIRATION_UNASSOCIATED_OBJECTS` environment variables.
}

begin
  # Add objects (bulk)
  result = api_instance.add_objects(collection, reason, request_body, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->add_objects: #{e}"
end
```

#### Using the add_objects_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BulkObjectResponse>, Integer, Hash)> add_objects_with_http_info(collection, reason, request_body, opts)

```ruby
begin
  # Add objects (bulk)
  data, status_code, headers = api_instance.add_objects_with_http_info(collection, reason, request_body, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BulkObjectResponse>
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->add_objects_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection to add the objects to. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **request_body** | [**Array&lt;Hash&gt;**](Hash.md) | List of objects to add. The order of the objects in this array is preserved in the response.  |  |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |
| **expiration_secs** | **String** | Object expiration time in seconds, cannot be set to 0. If not set, the default value is used. See the &#x60;PVAULT_EXPIRATION_ASSOCIATED_OBJECTS&#x60; and &#x60;PVAULT_EXPIRATION_UNASSOCIATED_OBJECTS&#x60; environment variables. | [optional] |

### Return type

[**BulkObjectResponse**](BulkObjectResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_object_by_id

> delete_object_by_id(collection, id, reason, opts)

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
collection = 'buyers' # String | The name of the collection containing the object.
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | The ID of the object.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
opts = {
  options: ['archived'], # Array<String> | Options for the operation. Options include: - `archived` – whether to delete only archived objects. If not specified, delete only active objects. 
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true # Boolean | Reloads the cache before the action.
}

begin
  # Delete object
  api_instance.delete_object_by_id(collection, id, reason, opts)
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->delete_object_by_id: #{e}"
end
```

#### Using the delete_object_by_id_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_object_by_id_with_http_info(collection, id, reason, opts)

```ruby
begin
  # Delete object
  data, status_code, headers = api_instance.delete_object_by_id_with_http_info(collection, id, reason, opts)
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
| **id** | **String** | The ID of the object. |  |
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


## delete_objects

> <BulkObjectResponse> delete_objects(collection, reason, opts)

Delete objects (bulk)

Deletes objects from a collection. This operation is irreversible.  If any object delete fails, the operation fails and no objects are deleted.  The maximum number of objects that can be deleted in one operation is determined by the [`PVAULT_SERVICE_MAX_PAGE_SIZE` environment variable](/guides/configure/environment-variables#service-and-features).   The role performing this operation must have both of the following: - The `CapDataWriter` capability. - At least one allowing policy and no denying policies for the `delete` operation for each of the properties defined for   the collection specified in the call.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data. 

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
collection = 'buyers' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
opts = {
  options: ['archived'], # Array<String> | Options for the operation. Options include: - `archived` – whether to delete only archived objects. If not specified, deletes only active objects. 
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  object_id: [PvaultSdk::ObjectID.new({id: 'id_example'})] # Array<ObjectID> | List of objects to delete. The order of the objects in the array is preserved in the response. 
}

begin
  # Delete objects (bulk)
  result = api_instance.delete_objects(collection, reason, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->delete_objects: #{e}"
end
```

#### Using the delete_objects_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BulkObjectResponse>, Integer, Hash)> delete_objects_with_http_info(collection, reason, opts)

```ruby
begin
  # Delete objects (bulk)
  data, status_code, headers = api_instance.delete_objects_with_http_info(collection, reason, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BulkObjectResponse>
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->delete_objects_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;archived&#x60; – whether to delete only archived objects. If not specified, deletes only active objects.  | [optional] |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |
| **object_id** | [**Array&lt;ObjectID&gt;**](ObjectID.md) | List of objects to delete. The order of the objects in the array is preserved in the response.  | [optional] |

### Return type

[**BulkObjectResponse**](BulkObjectResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_object_by_id

> Hash&lt;String, Object&gt; get_object_by_id(collection, id, reason, opts)

Get object

Returns an object from a collection with all or a subset of object property values.  The role performing this operation must have both of the following: - The `CapDataReader` capability. - At least one allowing policy and no denying policies for the `read` operation for each of the properties and the   collection requested in the call.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data.  **Warning**: Use of the `unsafe` option, to include all object property values, may expose more private information than is required, use with caution.

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
collection = 'buyers' # String | The name of the collection containing the object.
id = '463a83d0-a816-4902-abba-2486e0c0a0bb' # String | The ID of the object.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  x_trans_param: 'x_trans_param_example', # String | Extra parameter to pass on to the transformations.
  options: ['unsafe'], # Array<String> | Options for the operation. Options include: - `archived` – whether to list only archived objects. If not specified, list only active objects. - `show_builtins` – show built-in properties, can only be specified with `unsafe`. - `unsafe` – fetch all the properties, cannot be specified with `props`. 
  props: ['inner_example'] # Array<String> | The list of property names and transformations. To include multiple names and transformation bindings, provide a comma-separated list. For example, `props=first_name,last_name`. If the `unsafe` option is used, must be empty.
}

begin
  # Get object
  result = api_instance.get_object_by_id(collection, id, reason, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->get_object_by_id: #{e}"
end
```

#### Using the get_object_by_id_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> get_object_by_id_with_http_info(collection, id, reason, opts)

```ruby
begin
  # Get object
  data, status_code, headers = api_instance.get_object_by_id_with_http_info(collection, id, reason, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->get_object_by_id_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the object. |  |
| **id** | **String** | The ID of the object. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |
| **x_trans_param** | **String** | Extra parameter to pass on to the transformations. | [optional] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;archived&#x60; – whether to list only archived objects. If not specified, list only active objects. - &#x60;show_builtins&#x60; – show built-in properties, can only be specified with &#x60;unsafe&#x60;. - &#x60;unsafe&#x60; – fetch all the properties, cannot be specified with &#x60;props&#x60;.  | [optional] |
| **props** | [**Array&lt;String&gt;**](String.md) | The list of property names and transformations. To include multiple names and transformation bindings, provide a comma-separated list. For example, &#x60;props&#x3D;first_name,last_name&#x60;. If the &#x60;unsafe&#x60; option is used, must be empty. | [optional] |

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## hash_objects

> Array&lt;Array&lt;TokenValue&gt;&gt; hash_objects(collection, reason, hash_object_request, opts)

Hash objects

Creates a deterministic hash based on an object's property values, collection, and scope.  This operation is similar to using the [tokenize](/api/operations/tokenize) operation for a token of type `deterministic`. The hash value is identical to the token ID that is provided for the same combination of collection, object, property values, and scope. However, unlike the token, this hash is not stored in Vault's storage and, as such, cannot be detokenized, searched, or invalidated.

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
collection = 'buyers' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
hash_object_request = [PvaultSdk::HashObjectRequest.new({object: PvaultSdk::InputObject.new})] # Array<HashObjectRequest> | Details of the hashing request.
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true # Boolean | Reloads the cache before the action.
}

begin
  # Hash objects
  result = api_instance.hash_objects(collection, reason, hash_object_request, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->hash_objects: #{e}"
end
```

#### Using the hash_objects_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Array&lt;Array&lt;TokenValue&gt;&gt;, Integer, Hash)> hash_objects_with_http_info(collection, reason, hash_object_request, opts)

```ruby
begin
  # Hash objects
  data, status_code, headers = api_instance.hash_objects_with_http_info(collection, reason, hash_object_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Array&lt;Array&lt;TokenValue&gt;&gt;
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->hash_objects_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **hash_object_request** | [**Array&lt;HashObjectRequest&gt;**](HashObjectRequest.md) | Details of the hashing request. |  |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |

### Return type

**Array&lt;Array&lt;TokenValue&gt;&gt;**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
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
collection = 'buyers' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  page_size: 56, # Integer | The maximum number of items to return in this request. If not specified, the default value is used. The default value is the value specified in the environment variable `PVAULT_SERVICE_DEFAULT_PAGE_SIZE`. The value must not exceed the value specified in the environment variable `PVAULT_SERVICE_DEFAULT_PAGE_SIZE`
  cursor: 'cursor_example', # String | The cursor represents the state of consecutive queries for the same request parameters. In the first call, the cursor may be omitted or specified as an empty string. In consecutive calls, it should be set to the value of the cursor field of the objectFieldsPage returned by the previous call. Note: when the `id` is specified, paging is not supported. In this case, if the number of `id` values specified exceeds the maximum page size, the method returns 400 (BAD REQUEST).
  x_trans_param: 'x_trans_param_example', # String | Extra parameter to pass on to the transformations.
  ids: ['inner_example'], # Array<String> | A comma-separated list of object IDs
  options: ['unsafe'], # Array<String> | Options for the operation. Options include: - `archived` – whether to list only archived objects. If not specified, list only active objects. - `show_builtins` – show built-in properties, can only be specified with `unsafe`. - `unsafe` – fetch all the properties, cannot be specified with `props`. 
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
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;archived&#x60; – whether to list only archived objects. If not specified, list only active objects. - &#x60;show_builtins&#x60; – show built-in properties, can only be specified with &#x60;unsafe&#x60;. - &#x60;unsafe&#x60; – fetch all the properties, cannot be specified with &#x60;props&#x60;.  | [optional] |
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
collection = 'buyers' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
query = PvaultSdk::Query.new # Query | The query. This is a JSON object consisting of two maps in which the keys are property names.  The `in` map maps a property name to an array of possible values for that property. The `match` map maps a property name to the required value for that property. An object matches the query if the object meets the requirements of both maps. For example: ```json {   \"in\": {     \"email\": [\"john@work.com\", \"john@home.com\"],   },   \"match\": {     \"first_name\": \"John\",     \"last_name\": \"Doe\"   } } ``` is equivalent to: ```sql WHERE first_name = 'John' AND last_name='Doe' AND email IN ('john@work.com', 'john@home.com') ``` 
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  page_size: 56, # Integer | The maximum number of items to return in this request. If not specified, the default value is used. The default value is the value specified in the environment variable `PVAULT_SERVICE_DEFAULT_PAGE_SIZE`. The value must not exceed the value specified in the environment variable `PVAULT_SERVICE_DEFAULT_PAGE_SIZE`
  cursor: 'cursor_example', # String | The cursor represents the state of consecutive queries for the same request parameters. In the first call, the cursor may be omitted or specified as an empty string. In consecutive calls, it should be set to the value of the cursor field of the objectFieldsPage returned by the previous call. Note: when the `id` is specified, paging is not supported. In this case, if the number of `id` values specified exceeds the maximum page size, the method returns 400 (BAD REQUEST).
  x_trans_param: 'x_trans_param_example', # String | Extra parameter to pass on to the transformations.
  options: ['unsafe'], # Array<String> | Options for the operation. Options include: - `archived` – whether to search only archived objects. If not specified, search only active objects. - `show_builtins` – show built-in properties, can only be specified with `unsafe`. - `unsafe` – fetch all the properties, cannot be specified with `props`. 
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
| **query** | [**Query**](Query.md) | The query. This is a JSON object consisting of two maps in which the keys are property names.  The &#x60;in&#x60; map maps a property name to an array of possible values for that property. The &#x60;match&#x60; map maps a property name to the required value for that property. An object matches the query if the object meets the requirements of both maps. For example: &#x60;&#x60;&#x60;json {   \&quot;in\&quot;: {     \&quot;email\&quot;: [\&quot;john@work.com\&quot;, \&quot;john@home.com\&quot;],   },   \&quot;match\&quot;: {     \&quot;first_name\&quot;: \&quot;John\&quot;,     \&quot;last_name\&quot;: \&quot;Doe\&quot;   } } &#x60;&#x60;&#x60; is equivalent to: &#x60;&#x60;&#x60;sql WHERE first_name &#x3D; &#39;John&#39; AND last_name&#x3D;&#39;Doe&#39; AND email IN (&#39;john@work.com&#39;, &#39;john@home.com&#39;) &#x60;&#x60;&#x60;  |  |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |
| **page_size** | **Integer** | The maximum number of items to return in this request. If not specified, the default value is used. The default value is the value specified in the environment variable &#x60;PVAULT_SERVICE_DEFAULT_PAGE_SIZE&#x60;. The value must not exceed the value specified in the environment variable &#x60;PVAULT_SERVICE_DEFAULT_PAGE_SIZE&#x60; | [optional] |
| **cursor** | **String** | The cursor represents the state of consecutive queries for the same request parameters. In the first call, the cursor may be omitted or specified as an empty string. In consecutive calls, it should be set to the value of the cursor field of the objectFieldsPage returned by the previous call. Note: when the &#x60;id&#x60; is specified, paging is not supported. In this case, if the number of &#x60;id&#x60; values specified exceeds the maximum page size, the method returns 400 (BAD REQUEST). | [optional] |
| **x_trans_param** | **String** | Extra parameter to pass on to the transformations. | [optional] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;archived&#x60; – whether to search only archived objects. If not specified, search only active objects. - &#x60;show_builtins&#x60; – show built-in properties, can only be specified with &#x60;unsafe&#x60;. - &#x60;unsafe&#x60; – fetch all the properties, cannot be specified with &#x60;props&#x60;.  | [optional] |
| **props** | [**Array&lt;String&gt;**](String.md) | The list of property names and transformations. To include multiple names and transformation bindings, provide a comma-separated list. For example, &#x60;props&#x3D;first_name,last_name&#x60;. If the &#x60;unsafe&#x60; option is used, must be empty. | [optional] |

### Return type

[**ObjectFieldsPage**](ObjectFieldsPage.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_object_by_id

> update_object_by_id(collection, id, reason, request_body, opts)

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
collection = 'buyers' # String | The name of the collection containing the object.
id = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | The ID of the object.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
request_body = { key: 3.56} # Hash<String, Object> | The object properties to update.
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  expiration_secs: 'expiration_secs_example', # String | Object expiration time in seconds. If not set, the default is used. See the `PVAULT_EXPIRATION_ASSOCIATED_OBJECTS` and `PVAULT_EXPIRATION_UNASSOCIATED_OBJECTS` environment variables.
  options: ['archived'] # Array<String> | Options for the operation. Options include: - `archived` – whether to update only archived objects. If not specified, update only active objects. 
}

begin
  # Update object
  api_instance.update_object_by_id(collection, id, reason, request_body, opts)
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->update_object_by_id: #{e}"
end
```

#### Using the update_object_by_id_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_object_by_id_with_http_info(collection, id, reason, request_body, opts)

```ruby
begin
  # Update object
  data, status_code, headers = api_instance.update_object_by_id_with_http_info(collection, id, reason, request_body, opts)
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
| **id** | **String** | The ID of the object. |  |
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


## update_objects

> <BulkObjectResponse> update_objects(collection, reason, opts)

Update objects (bulk)

Updates properties of objects in a collection.  If any object update fails, the operation fails and no objects are updated.  The maximum number of objects that can be updated in one operation is determined by the [`PVAULT_SERVICE_MAX_PAGE_SIZE` environment variable](/guides/configure/environment-variables#service-and-features).  The role performing this operation must have both of the following: - The `CapDataWriter` capability. - For each object in the request, at least one allowing policy and no denying policies for the `write` operation for each of the object's properties.  See [identity and access management](/data-security/identity-and-access-management) for more information about how  capabilities are used to control access to operations and policies are used to control access to data. 

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
collection = 'buyers' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
opts = {
  expiration_secs: 'expiration_secs_example', # String | Expiration time in seconds for the tokens. If not set, the expiry dates of the tokens are not changed.
  options: ['archived'], # Array<String> | Options for the operation. Options include: - `archived` – whether to update only archived objects. If not specified, updates only active objects. 
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true, # Boolean | Reloads the cache before the action.
  request_body: [{ key: 3.56}] # Array<Hash> | List of objects properties to update. The order of the objects in the array is preserved in the response. 
}

begin
  # Update objects (bulk)
  result = api_instance.update_objects(collection, reason, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->update_objects: #{e}"
end
```

#### Using the update_objects_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BulkObjectResponse>, Integer, Hash)> update_objects_with_http_info(collection, reason, opts)

```ruby
begin
  # Update objects (bulk)
  data, status_code, headers = api_instance.update_objects_with_http_info(collection, reason, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BulkObjectResponse>
rescue PvaultSdk::ApiError => e
  puts "Error when calling ObjectsApi->update_objects_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **expiration_secs** | **String** | Expiration time in seconds for the tokens. If not set, the expiry dates of the tokens are not changed. | [optional] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;archived&#x60; – whether to update only archived objects. If not specified, updates only active objects.  | [optional] |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |
| **request_body** | [**Array&lt;Hash&gt;**](Hash.md) | List of objects properties to update. The order of the objects in the array is preserved in the response.  | [optional] |

### Return type

[**BulkObjectResponse**](BulkObjectResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

