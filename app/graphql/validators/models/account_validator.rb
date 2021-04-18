module Validators
  module Models
    class AccountValidator
      def self.validates(variables_param)
        email = variables_param[:auth_provider]&.[](:credentials)&.[](:email)
        existing_account = Account.find_by(email: email)
        raise GraphQL::ExecutionError, I18n.t("account.errors.email.already_registred") unless existing_account.blank?
      end
    end
  end
end
