require 'uri'
require 'piiano/vault/encryption/encryptor'
class User < ApplicationRecord
    encrypts :name, encryptor: Piiano::Vault::Encryption::Encryptor.new(:name)
    encrypts :ssn, encryptor: Piiano::Vault::Encryption::Encryptor.new(:ssn)
    encrypts :email, encryptor: Piiano::Vault::Encryption::Encryptor.new(:email), deterministic: true, downcase: true

    validates :name,
        format: { with: /\A[^`!@#$%\^&*+=<>{}"?]+\z/ },
        length: { maximum: 256 },
        allow_blank: true,
        allow_nil: true

    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
