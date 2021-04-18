module Services
  module AccountService
    class CreateAccountService
      attr_reader :service_args

      def perform(service_args)
        @service_args = service_args.to_h

        Validators::Models::AccountValidator.validates(@service_args)
        create
      end

      def create
        ::Account.create!(name: service_args[:name], email: service_args[:email], password: service_args[:password], api_token: "token-#{service_args[:email]}")
      end
    end
  end
end
