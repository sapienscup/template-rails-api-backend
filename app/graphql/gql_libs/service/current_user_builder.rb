module GqlLibs
  module Service
    class CurrentUserBuilder
      def self.call(request, session)
        authentication_token = request.headers["Authorization"]

        return unless authentication_token

        account_found = Account.find_by(authentication_token: authentication_token)

        raise "account not found" unless account_found

        account_found
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        nil
      end
    end
  end
end
