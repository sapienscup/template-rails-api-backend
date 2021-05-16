module Mutations
  module AccountMutation
    class SignInAccount < Mutations::BaseMutation
      type Types::AccountType

      argument :credentials, Inputs::AuthProviderCredentialsInput, required: false

      def resolve(credentials: nil)
        Services::TokenServices::GenerateTokenService.new.perform(credentials: credentials.to_h)
      end
    end
  end
end
