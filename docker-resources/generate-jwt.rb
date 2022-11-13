# https://docs.github.com/en/developers/apps/building-github-apps/authenticating-with-github-apps#authenticating-as-a-github-app

require 'openssl'
require 'jwt'  # https://rubygems.org/gems/jwt

path_to_pem = '/pem/' + ENV["PEM_FILE"]
app_id = ENV["APP_ID"]

if (!path_to_pem)
  abort("Please set the environment variable PATH_TO_PEM, see README.md")
end

if (!app_id)
  abort("Please set the environment variable APP_ID, see README.md")
end

# Private key contents
private_pem = File.read(path_to_pem)
private_key = OpenSSL::PKey::RSA.new(private_pem)

# Generate the JWT
payload = {
  # issued at time, 60 seconds in the past to allow for clock drift
  iat: Time.now.to_i - 60,
  # JWT expiration time (10 minute maximum)
  exp: Time.now.to_i + (10 * 60),
  # GitHub App's identifier
  iss: app_id
}

jwt = JWT.encode(payload, private_key, "RS256")
puts jwt
