# PvaultSdk::TokensApi

All URIs are relative to *http://localhost:8123*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**delete_tokens**](TokensApi.md#delete_tokens) | **DELETE** /api/pvlt/1.0/data/collections/{collection}/tokens | Delete tokens |
| [**detokenize**](TokensApi.md#detokenize) | **GET** /api/pvlt/1.0/data/collections/{collection}/tokens | Detokenize tokens |
| [**rotate_tokens**](TokensApi.md#rotate_tokens) | **POST** /api/pvlt/1.0/data/collections/{collection}/rotate/tokens | Rotate tokens |
| [**search_tokens**](TokensApi.md#search_tokens) | **POST** /api/pvlt/1.0/data/collections/{collection}/query/tokens | Search tokens |
| [**tokenize**](TokensApi.md#tokenize) | **POST** /api/pvlt/1.0/data/collections/{collection}/tokens | Tokenize |
| [**update_tokens**](TokensApi.md#update_tokens) | **PATCH** /api/pvlt/1.0/data/collections/{collection}/tokens | Update tokens |


## delete_tokens

> delete_tokens(collection, reason, opts)

Delete tokens

Deletes tokens.  The tokens to delete are those that match all the criteria in the `token_ids`, `object_ids`,  and `tags` parameters. If the token query finds no matches, the operation returns a 404 error. See [search tokens](search-tokens) for more details.  The role performing this operation must have both of these: - The `CapTokensWriter` capability. - At least one allowing policy and no denying policies for the `delete` operation for the `tokens` resource of the specified collection.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data. 

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::TokensApi.new
collection = 'buyers' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
opts = {
  object_ids: ['inner_example'], # Array<String> | Comma-separated list of object IDs.
  tags: ['inner_example'], # Array<String> | Comma-separated list of tags.
  token_ids: ['inner_example'], # Array<String> | Comma-separated list of token IDs.
  options: ['archived'], # Array<String> | Options for the operation. Options include: - `archived` – whether to delete only archived tokens. If not specified, delete only active tokens. 
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true # Boolean | Reloads the cache before the action.
}

begin
  # Delete tokens
  api_instance.delete_tokens(collection, reason, opts)
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->delete_tokens: #{e}"
end
```

#### Using the delete_tokens_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_tokens_with_http_info(collection, reason, opts)

```ruby
begin
  # Delete tokens
  data, status_code, headers = api_instance.delete_tokens_with_http_info(collection, reason, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->delete_tokens_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **object_ids** | [**Array&lt;String&gt;**](String.md) | Comma-separated list of object IDs. | [optional] |
| **tags** | [**Array&lt;String&gt;**](String.md) | Comma-separated list of tags. | [optional] |
| **token_ids** | [**Array&lt;String&gt;**](String.md) | Comma-separated list of token IDs. | [optional] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;archived&#x60; – whether to delete only archived tokens. If not specified, delete only active tokens.  | [optional] |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## detokenize

> <Array<DetokenizedToken>> detokenize(collection, reason, opts)

Detokenize tokens

Returns the object property values for tokens.  The tokens returned by this operation are defined using three query parameters: `token_ids`, `object_ids`, and `tags`. If the token query includes an invalid or not found token ID, the operation returns a 404 status code. Otherwise, the operation returns an empty response if it finds no matches. See the [Retrieve a token](/guides/tokenize-personal-data/retrieve-a-token) guide for more information about how to match tokens for this operation.  The role performing this operation must have all of these: - The `CapTokensDetokenizer` capability. - Policies:   + At least one allowing policy and no denying policies for the `detokenize` operation for each of the collection properties that are tokenized by tokens specified in the query.   + At least one allowing policy and no denying policies for the `read` operation for each of the collection properties that are tokenized by tokens specified in the query.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data. 

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::TokensApi.new
collection = 'buyers' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
opts = {
  object_ids: ['inner_example'], # Array<String> | Comma-separated list of object IDs.
  options: ['include_metadata'], # Array<String> | Options for the operation. Options include: - `include_metadata` - show token metadata in the response. 
  tags: ['inner_example'], # Array<String> | Comma-separated list of tags.
  token_ids: ['inner_example'], # Array<String> | Comma-separated list of token IDs.
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true # Boolean | Reloads the cache before the action.
}

begin
  # Detokenize tokens
  result = api_instance.detokenize(collection, reason, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->detokenize: #{e}"
end
```

#### Using the detokenize_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<DetokenizedToken>>, Integer, Hash)> detokenize_with_http_info(collection, reason, opts)

```ruby
begin
  # Detokenize tokens
  data, status_code, headers = api_instance.detokenize_with_http_info(collection, reason, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<DetokenizedToken>>
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->detokenize_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **object_ids** | [**Array&lt;String&gt;**](String.md) | Comma-separated list of object IDs. | [optional] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;include_metadata&#x60; - show token metadata in the response.  | [optional] |
| **tags** | [**Array&lt;String&gt;**](String.md) | Comma-separated list of tags. | [optional] |
| **token_ids** | [**Array&lt;String&gt;**](String.md) | Comma-separated list of token IDs. | [optional] |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |

### Return type

[**Array&lt;DetokenizedToken&gt;**](DetokenizedToken.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## rotate_tokens

> Hash&lt;String, String&gt; rotate_tokens(token_ids, collection, reason, opts)

Rotate tokens

Generates new token IDs for a list of tokens.  The role performing this operation must have both of these: - The `CapTokensWriter` capability. - At least one allowing policy and no denying policies for the `write` operation for the `tokens` resource of the specified collection.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data. 

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::TokensApi.new
token_ids = ['inner_example'] # Array<String> | Comma-separated list of token IDs.
collection = 'buyers' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
opts = {
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true # Boolean | Reloads the cache before the action.
}

begin
  # Rotate tokens
  result = api_instance.rotate_tokens(token_ids, collection, reason, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->rotate_tokens: #{e}"
end
```

#### Using the rotate_tokens_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, String&gt;, Integer, Hash)> rotate_tokens_with_http_info(token_ids, collection, reason, opts)

```ruby
begin
  # Rotate tokens
  data, status_code, headers = api_instance.rotate_tokens_with_http_info(token_ids, collection, reason, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, String&gt;
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->rotate_tokens_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **token_ids** | [**Array&lt;String&gt;**](String.md) | Comma-separated list of token IDs. |  |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |

### Return type

**Hash&lt;String, String&gt;**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_tokens

> <Array<TokenMetadata>> search_tokens(collection, reason, query_token, opts)

Search tokens

Lists tokens with their metadata.   If the token query includes an invalid or not found token ID, the operation returns a 404 error. Otherwise, if no matches are found, the operation returns an empty response.   The role performing this operation must have all of these: - The `CapTokensReader` capability. - At least one allowing policy and no denying policies for the `read` operation for the `tokens` resource of the specified collection.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data.  The tokens returned by this operation are defined using three query parameters: `token_ids`, `object_ids`, and `tags`. If the token query includes an invalid or not found token ID, the operation returns a 404 status code. Otherwise, the operation returns an empty response if it finds no matches. See the [Retrieve a token](/guides/tokenize-personal-data/retrieve-a-token) guide for more information about how to match tokens for this operation.  

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::TokensApi.new
collection = 'buyers' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
query_token = PvaultSdk::QueryToken.new # QueryToken | The token query.
opts = {
  options: ['archived'], # Array<String> | Options for the operation. Options include: - `archived` – whether to search only archived tokens. If not specified, search only active tokens. 
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true # Boolean | Reloads the cache before the action.
}

begin
  # Search tokens
  result = api_instance.search_tokens(collection, reason, query_token, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->search_tokens: #{e}"
end
```

#### Using the search_tokens_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<TokenMetadata>>, Integer, Hash)> search_tokens_with_http_info(collection, reason, query_token, opts)

```ruby
begin
  # Search tokens
  data, status_code, headers = api_instance.search_tokens_with_http_info(collection, reason, query_token, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<TokenMetadata>>
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->search_tokens_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **query_token** | [**QueryToken**](QueryToken.md) | The token query. |  |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;archived&#x60; – whether to search only archived tokens. If not specified, search only active tokens.  | [optional] |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |

### Return type

[**Array&lt;TokenMetadata&gt;**](TokenMetadata.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## tokenize

> <Array<TokenValue>> tokenize(collection, reason, tokenize_request, opts)

Tokenize

Creates tokens that reference the values of objects' properties. The token ID is partially or wholly randomly-generated and, therefore, is not sensitive.  The returned token IDs are in the same order as the object IDs in the request. No tokens are created if any object IDs are invalid or not found.  If this operation is called for an object ID and properties that have a token: - Any token tags are appended to the existing token. - If an expiration is specified, then the token expiry is updated. If an expiration is not specified, the token expiry is updated if the default settings result in an expiry date after the token's current expiry date.  The role performing this operation must have both of these: - The `CapTokensWriter` capability. - At least one allowing policy and no denying policies for the `tokenize` operation for each of the collection properties specified in the call.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data. 

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::TokensApi.new
collection = 'buyers' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
tokenize_request = [PvaultSdk::TokenizeRequest.new({type: PvaultSdk::TokenType::PCI, object: PvaultSdk::InputObject.new, props: ['credit_card_no']})] # Array<TokenizeRequest> | Details of the tokenization request.
opts = {
  expiration_secs: 'expiration_secs_example', # String | Token expiration time in seconds. If not set, the default expiration time is used. See the `PVAULT_EXPIRATION_TOKENS` variable.
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true # Boolean | Reloads the cache before the action.
}

begin
  # Tokenize
  result = api_instance.tokenize(collection, reason, tokenize_request, opts)
  p result
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->tokenize: #{e}"
end
```

#### Using the tokenize_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<TokenValue>>, Integer, Hash)> tokenize_with_http_info(collection, reason, tokenize_request, opts)

```ruby
begin
  # Tokenize
  data, status_code, headers = api_instance.tokenize_with_http_info(collection, reason, tokenize_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<TokenValue>>
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->tokenize_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **tokenize_request** | [**Array&lt;TokenizeRequest&gt;**](TokenizeRequest.md) | Details of the tokenization request. |  |
| **expiration_secs** | **String** | Token expiration time in seconds. If not set, the default expiration time is used. See the &#x60;PVAULT_EXPIRATION_TOKENS&#x60; variable. | [optional] |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |

### Return type

[**Array&lt;TokenValue&gt;**](TokenValue.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_tokens

> update_tokens(collection, reason, update_token_request, opts)

Update tokens

Updates `tags` and `expiration` token metadata.  The role performing this operation must have both of these: - The `CapTokensWriter` capability. - At least one allowing policy and no denying policies for the `write` operation for the `tokens` resource of the collection specified in the call.  See [identity and access management](/data-security/identity-and-access-management) for more information about how capabilities are used to control access to operations and policies are used to control access to data.  The tokens returned by this operation are defined using three query parameters: `token_ids`, `object_ids`, and `tags`. If no tokens are matched, status code 404 is returned. See the [Retrieve a token](/guides/tokenize-personal-data/retrieve-a-token) guide for more information about how to match tokens for this operation. 

### Examples

```ruby
require 'time'
require 'pvault-sdk'
# setup authorization
PvaultSdk.configure do |config|
  # Configure Bearer authorization (JWT): bearerAuth
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = PvaultSdk::TokensApi.new
collection = 'buyers' # String | The name of the collection containing the objects.
reason = 'AppFunctionality' # String | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false.
update_token_request = PvaultSdk::UpdateTokenRequest.new({tags: ['credit_cards']}) # UpdateTokenRequest | Update token request details.
opts = {
  expiration_secs: 'expiration_secs_example', # String | Expiration time in seconds for the tokens. If not set, the expiry dates of the tokens are not changed.
  object_ids: ['inner_example'], # Array<String> | Comma-separated list of object IDs.
  tags: ['inner_example'], # Array<String> | Comma-separated list of tags.
  token_ids: ['inner_example'], # Array<String> | Comma-separated list of token IDs.
  options: ['archived'], # Array<String> | Options for the operation. Options include: - `archived` – whether to update only archived tokens. If not specified, update only active tokens. 
  adhoc_reason: 'adhoc_reason_example', # String | An ad-hoc reason for accessing the Vault data.
  reload_cache: true # Boolean | Reloads the cache before the action.
}

begin
  # Update tokens
  api_instance.update_tokens(collection, reason, update_token_request, opts)
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->update_tokens: #{e}"
end
```

#### Using the update_tokens_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_tokens_with_http_info(collection, reason, update_token_request, opts)

```ruby
begin
  # Update tokens
  data, status_code, headers = api_instance.update_tokens_with_http_info(collection, reason, update_token_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PvaultSdk::ApiError => e
  puts "Error when calling TokensApi->update_tokens_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **collection** | **String** | The name of the collection containing the objects. |  |
| **reason** | **String** | Details of the reason for requesting the property. The default is set when no access reason is provided and PVAULT_SERVICE_FORCE_ACCESS_REASON is false. |  |
| **update_token_request** | [**UpdateTokenRequest**](UpdateTokenRequest.md) | Update token request details. |  |
| **expiration_secs** | **String** | Expiration time in seconds for the tokens. If not set, the expiry dates of the tokens are not changed. | [optional] |
| **object_ids** | [**Array&lt;String&gt;**](String.md) | Comma-separated list of object IDs. | [optional] |
| **tags** | [**Array&lt;String&gt;**](String.md) | Comma-separated list of tags. | [optional] |
| **token_ids** | [**Array&lt;String&gt;**](String.md) | Comma-separated list of token IDs. | [optional] |
| **options** | [**Array&lt;String&gt;**](String.md) | Options for the operation. Options include: - &#x60;archived&#x60; – whether to update only archived tokens. If not specified, update only active tokens.  | [optional] |
| **adhoc_reason** | **String** | An ad-hoc reason for accessing the Vault data. | [optional] |
| **reload_cache** | **Boolean** | Reloads the cache before the action. | [optional] |

### Return type

nil (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

