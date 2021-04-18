module Mutations
  module AccountMutation
    class CreateAccount < Mutations::BaseMutation
      type Types::AccountType

      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      class AuthProviderSignupData < Types::BaseInputObject
        argument :credentials, Inputs::AuthProviderCredentialsInput, required: true
      end

      argument :name, String, required: true
      argument :auth_provider, AuthProviderSignupData, required: true

      def resolve(**service_args)
        Services::AccountService::CreateAccountService.new.perform(service_args)
      end
    end
  end
end
