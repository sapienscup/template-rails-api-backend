require "rails_helper"

RSpec.describe "Mutations::AccountMutation::CreateAccounts", type: :request do
  let(:query) {
    <<-GRAPHQL
    mutation CreateAccount($name: String!, $authProvider: AuthProviderSignupData!) {
      createAccount(name: $name, authProvider: $authProvider) {
        id
        email
        name
      }
    }
    GRAPHQL
  }

  let(:operation_name) {
    "CreateAccount"
  }

  let(:variables) {
    {
      "name": "ab",
      "authProvider": {
        "credentials": {
          "email": "a@b.c.d",
          "password": "hui"
        }
      }
    }
  }

  describe ".resolve" do
    context "valid params" do
      let(:email) { "a@b.c.d" }
      let(:name) { "ab" }

      it "should create an account" do
        response = WalrusSchema.execute(query, variables: variables, context: {}, operation_name: operation_name)
        data = response.to_h.deep_symbolize_keys

        expect(data[:data][:createAccount][:email]).to eq(email)
        expect(data[:data][:createAccount][:name]).to eq(name)
      end
    end
  end
end
