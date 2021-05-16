module Services
  module TokenServices
    class GenerateTokenService
      def perform(credentials: nil)
        return unless credentials

        account = Account.find_by(email: credentials[:email])

        raise ArgumentError, I18n.t("standards.errors.not_found") unless account&.authenticate(credentials[:password])

        account
      end
    end
  end
end
