module Mutations
  module AccountMutation
    class SignInAccount < Mutations::BaseMutation
      null true

      argument :credentials, Inputs::AuthProviderCredentialsInput, required: false

      field :token, String, null: true
      field :account, Types::AccountType, null: true

      def resolve(credentials: nil)
        return unless credentials

        account = Account.find_by email: credentials[:email]

        return unless account
        return unless account.authenticate(credentials[:password])

        crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
        token = crypt.encrypt_and_sign("account-id:#{ account.id }")

        context[:session][:token] = token

        { account: account, token: token }
      end
    end
  end
end
