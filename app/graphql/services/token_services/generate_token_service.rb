module Services
  module TokenServices
    class GenerateTokenService
      def perform(credentials: nil)
        return unless credentials

        account = Account.find_by(email: credentials[:email])

        raise ArgumentError, I18n.t("standars.errors.not_found") unless account
        return unless account.authenticate(credentials[:password])

        rails_app_secret_key_sliced = Rails.application.secrets.secret_key_base.byteslice(0..31)
        crypt = ActiveSupport::MessageEncryptor.new(rails_app_secret_key_sliced, cipher: "aes-256-gcm")
        token = crypt.encrypt_and_sign("account-id:#{account.id}", purpose: :login, expires_in: 20.minutes)

        OpenStruct.new({ account: account, token: token })
      end
    end
  end
end
