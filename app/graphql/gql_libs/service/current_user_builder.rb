module GqlLibs
  module Service
    class CurrentUserBuilder
      def self.call(request, session)
        authentication_token = request.headers["Authorization"]

        raise SecurityError, I18n.t("standards.errors.authorization_header_not_found") unless authentication_token

        account_found = Account.find_by(authentication_token: authentication_token)

        raise SecurityError, I18n.t("standards.errors.not_found") unless account_found

        account_found
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        nil
      end
    end
  end
end
