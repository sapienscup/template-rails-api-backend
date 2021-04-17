module Inputs
  class AuthProviderInput < Types::BaseInputObject
    argument :credentials, Inputs::AuthProviderCredentialsInput, required: true
  end
end
