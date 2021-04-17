module Mutations
  module AccountMutation
    class CreateUser < Mutations::BaseMutation
      type Types::UserType

      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      class AuthProviderSignupData < Types::BaseInputObject
        argument :credentials, Inputs::AuthProviderCredentialsInput, required: false
      end

      argument :name, String, required: true
      argument :auth_provider, AuthProviderSignupData, required: false

      def resolve(name: nil, auth_provider: nil)
        Services::AccountService::CreateUserService.new.perform(
          name: name,
          email: auth_provider&.[](:credentials)&.[](:email),
          password: auth_provider&.[](:credentials)&.[](:password)
        )
      end
    end
  end
end
