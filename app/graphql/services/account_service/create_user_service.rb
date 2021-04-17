module Services
  module AccountService
    class CreateUserService
      def perform(name: nil, email: nil, password: nil)
        ::User.create!(name: name, email: email, password: password, api_token: "token-#{email}")
      end
    end
  end
end
