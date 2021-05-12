module Services
  module AccountServices
    class CreateAccountService
      attr_reader :service_args

      def perform(service_args)
        @service_args = service_args.to_h
        Validators::Models::AccountValidator.validates(@service_args)
        create
      end

      def create
        ::Account.create!(
          name: service_args[:name],
          email: service_args[:auth_provider][:credentials][:email],
          password: service_args[:auth_provider][:credentials][:password],
          api_token: "token-undefined"
        )
      end
    end
  end
end
