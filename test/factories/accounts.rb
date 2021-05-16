FactoryBot.define do
  factory :account do
    api_token { "#" }
    email { "a@b.com.br" }
    password { "#" }
    name { "ab" }
  end
end
