module GqlLibs
  module Service
    class CurrentUserBuilder
      attr_reader :params, :request, :session, :extract_end_point

      def initialize(params, request, session, extract_end_point)
        @params = params
        @request = request
        @session = session
        @extract_end_point = extract_end_point
      end

      def perform
        return true if user_try_sign_in?
        return true if user_try_create_account?

        authentication_token = request.headers["Authorization"]

        raise SecurityError, I18n.t("standards.errors.authorization_header_not_found") unless authentication_token

        account_found = Account.find_by(authentication_token: authentication_token)

        raise SecurityError, I18n.t("standards.errors.not_found") unless account_found

        account_found
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        nil
      end

      private

      def user_try_sign_in?
        return nil if extract_end_point.nil?

        sign_in_account_name = Mutations::AccountMutation::SignInAccount.name.split("::").last.downcase
        extract_end_point_downcase = extract_end_point.downcase

        extract_end_point_downcase == sign_in_account_name && \
        extract_end_point_downcase == sign_in_account_name
      end

      def user_try_create_account?
        return nil if extract_end_point.nil?

        sign_in_account_name = Mutations::AccountMutation::CreateAccount.name.split("::").last.downcase
        extract_end_point_downcase = extract_end_point.downcase

        extract_end_point_downcase == sign_in_account_name && \
        extract_end_point_downcase == sign_in_account_name
      end
    end
  end
end
