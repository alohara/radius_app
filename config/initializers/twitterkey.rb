# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
  require 'twitter'
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "WC4fVSrOM5lXzGFfwDgSnA"
    config.consumer_secret     = "fM90UwlUokm2t1yBWDmJAFqBX2fqVztbfLVT2ZjcM"
    config.access_token        = "14070254-H1WduuxRbjxuLdK9ILNmu7VsnAfLgELLAzT5RD7wX"
    config.access_token_secret = "gDrLp9JuUOKtZoUgGIdv8zG2QAj1AwQuACTReDkOH9cHZ"
  end
