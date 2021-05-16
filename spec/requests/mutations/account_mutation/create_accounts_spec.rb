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
              "email": "ab@c.d.f",
              "password": "hui"
          }
      }
    }
  }

  describe ".resolve" do
    context 'valid params' do
      it "should create an account" do
        post '/graphql', params: { query: query, variables: variables }
        json = JSON.parse(response.body)
        data = json['data']['createAccount']

        expect(response).to have_http_status(200)
      end
    end
  end
end
