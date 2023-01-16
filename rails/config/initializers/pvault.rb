PvaultSdk.configure do |config|
    # Configure Bearer authorization (JWT): bearerAuth
    config.access_token = ENV.fetch('PVAULT_API_KEY') { Rails.application.credentials.pvault_api_key } 
    config.debugging = true
end
