require 'rails_helper'

RSpec.describe "Mutations::AccountMutation::CreateAccounts", type: :request do
  let(:query) {
    <<~GQL
    mutation CreateAccount($name: String!, $authProvider: AuthProviderSignupData!) {
      createAccount(name: $name, authProvider: $authProvider) {
        id
        email
        name
      }
    }
    GQL
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
    context 'valid params' do
      it "should create an account" do
        post("/graphql", params: { query: query, variables: JSON.dump(variables) }, headers: headers)
        @body = response.body
        byebug

        expect(response).to have_http_status(200)
      end
    end
  end
end
