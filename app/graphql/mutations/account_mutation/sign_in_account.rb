module Mutations
  module AccountMutation
    class SignInAccount < Mutations::BaseMutation
      null true

      argument :credentials, Inputs::AuthProviderCredentialsInput, required: false

      field :token, String, null: true
      field :account, Types::AccountType, null: true

      def resolve(credentials: nil)
        account_with_token = Services::TokenServices::GenerateTokenService.new.perform(credentials: credentials.to_h)
        set_token_in_context_session(account_with_token.token)

        account_with_token
      end
    end
  end
end
