# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# SampleApp::Application.config.secret_key_base = 'f33ca85b90fcb06f4f816f124e5fc58d9bffeabcb8fac932ab7b532dbf663485f0bc7f4d878431d8ee6b43abfaa6263d7bd183cf0ccbf0eb7f2530317df0d667'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
	#Use the existing token.
	File.read(token_file).chomp
	else
	# Generate a new token and store it in token_file.
	token = SecureRandom.hex(64)
	File.write(token_file, token)
	token
	end
end
SampleApp::Application.config.secret_key_base = secure_token
