require 'pvault-sdk'

module Piiano
  module Vault
    module Encryption
      class Encryptor

        def initialize(property_name)
          @property_name = property_name
        end

        def encrypt(clear_text, key_provider: nil, cipher_options: {})
          Rails.logger.debug("Encrypting #{@property_name}, options=#{cipher_options}")
          # TODO: Call PvaultSdk encrypt
          clear_text
        end

        def decrypt(encrypted_text, key_provider: nil)
          Rails.logger.debug("Decrypting #{@property_name}")
          # TODO: Call PvaultSdk encrypt
          encrypted_text
        end

        def encrypted?(text)
          false
        end
      end
    end
  end
end