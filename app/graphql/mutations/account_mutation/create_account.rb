module Mutations
  module AccountMutation
    class CreateAccount < Mutations::BaseMutation
      type Types::AccountType

      class AuthProviderSignupData < Types::BaseInputObject
        argument :credentials, Inputs::AuthProviderCredentialsInput, required: true
      end

      argument :name, String, required: true
      argument :auth_provider, AuthProviderSignupData, required: true

      def resolve(**service_args)
        Services::AccountServices::CreateAccountService.new.perform(service_args)
      end
    end
  end
end
