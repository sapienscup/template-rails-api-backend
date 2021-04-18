module Validators
  module Models
    class AccountValidator
      def self.validates(variables_param)
        raise GraphQL::ExecutionError, "Unexpected parameter: name" unless variables_param[:name].present?
        raise GraphQL::ExecutionError, "Unexpected parameter: auth_provider.credentials.email" unless variables_param[:auth_provider]&.[](:credentials)&.[](:email).present?,
        raise GraphQL::ExecutionError, "Unexpected parameter: auth_provider.credentials.password" unless variables_param[:auth_provider]&.[](:credentials)&.[](:password).present?
      end
    end
  end
end
