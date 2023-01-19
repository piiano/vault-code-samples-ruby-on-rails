require 'time'
require 'pvault-sdk'
require 'json'

module Piiano
  module Vault
    module Encryption

      # An encryptor that uses Piiano Vault tokenization
      # for encrypting and decrypting attribute values.
      #
      # It interacts with a running Piiano Vault instance and accepts the collection and property names
      # to be used for tokenization.
      #
      # https://piiano.com/docs/guides/tokenize-personal-data/about-tokens
      class Tokenizer
        def initialize(options)
          options = sanitize_options(options)
          
          @collection = options[:collection]
          @property = options[:property]
          @reason = options[:reason] || 'AppFunctionality'

          config = PvaultSdk::Configuration.default
          # Make sure array encoding is multi-value instead of indexed pairs
          # https://github.com/typhoeus/ethon/blob/v0.16.0/lib/ethon/easy/queryable.rb#L97
          config.params_encoding = :multi
          @api_client = PvaultSdk::ApiClient.new(config)

          @tokens_api = PvaultSdk::TokensApi.new(@api_client)
          @objects_api = PvaultSdk::ObjectsApi.new(@api_client)
        end

        def encrypt(clear_text, key_provider: nil, cipher_options: {})
          validate_payload_type(clear_text)
          tokenize(clear_text, cipher_options)
        end

        def decrypt(encrypted_text, key_provider: nil)
          detokenize(encrypted_text)
        end

        def encrypted?(text)
          # Since encrypted text is expected to be a valid token, 
          # we just search for a valid token by the encrypted text as the token ID.
          
          query_token = PvaultSdk::QueryToken.new({
            token_ids: [text], # Array<String> | Comma-separated list of token IDs.
          })

          begin
            # Detokenize tokens
            result = @tokens_api.search_tokens(@collection, @reason, query_token)
          rescue PvaultSdk::ApiError => e
            false
          end
        end

        protected

        def tokenize(clear_text, cipher_options)
          # Tokenization for encryption is the process 
          # of adding an object with the property value and tokenizing it.
          opts = {}

          begin
            # Add a secure object to Vault.  This is an anti-patern 
            request_body = {}
            request_body[@property] = clear_text
            add_object_result = @objects_api.add_object(@collection, @reason, request_body, opts)

            # Tokenize
            tokenize_request = PvaultSdk::TokenizeRequest.new({
              object: PvaultSdk::InputObject.new({"id": add_object_result.id}),
              props: [@property],
            })

            tokenize_request.type = PvaultSdk::TokenType.build_from_hash(
              cipher_options[:deterministic] ? "deterministic" : "randomized"
            )

            tokenize_result = @tokens_api.tokenize(@collection, @reason, [tokenize_request], opts)
            # We get an array of tokenize results. Pick the first one and return the token_id
            tokenize_result&.first&.token_id
          rescue PvaultSdk::ApiError => e
            body = JSON.parse(e.response_body) rescue nil
            if body&.dig("error_code") == 'PV3002'
              raise ActiveRecord::Encryption::Errors::Encoding, body&.dig("message")
            else
              raise ActiveRecord::Encryption::Errors::Encryption
            end
          end
        end

        def detokenize(encrypted_text)
          # Detokenization will return the clear text for a given token
          
          opts = {
            token_ids: [encrypted_text], # Array<String> | Comma-separated list of token IDs.
          }

          begin
            # Detokenize tokens
            result = @tokens_api.detokenize(@collection, @reason, opts)
            result&.first&.fields[@property.to_s]
          rescue PvaultSdk::ApiError => e
            raise ActiveRecord::Encryption::Errors::Decryption
          end
        end
        
        def validate_payload_type(clear_text)
          unless clear_text.is_a?(String)
            raise ActiveRecord::Encryption::Errors::ForbiddenClass, "The encryptor can only encrypt string values (#{clear_text.class})"
          end
        end

        def sanitize_options(options)
          return {} if options.nil?
  
          final_options = {}
          final_options[:collection] = options[:collection] if options[:collection]
          final_options[:property] = options[:property] if options[:property]
          final_options[:reason] = options[:reason] if options[:reason]
          final_options
        end

      end
    end
  end
end