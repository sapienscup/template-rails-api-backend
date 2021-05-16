module GqlLibs
  module Service
    class CurrentUserBuilder
      def self.call(request, session)
        # if we want to change the sign-in strategy, this is the place to do it
        return unless session[:token]
        crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
        token = crypt.decrypt_and_verify(session[:token])
        account_id = token.gsub('account-id:', '').to_i
        Account.find(account_id)
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        nil
      end
    end
  end
end
