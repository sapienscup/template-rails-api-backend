require 'test_helper'

class Resolvers::CreateAccountTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateAccount.new.call(nil, args, nil)
  end

  test 'creating new account' do
    account = perform(
      name: 'Test Account',
      authProvider: {
        email: {
          email: 'email@example.com',
          password: '[omitted]'
        }
      }
    )

    assert account.persisted?
    assert_equal account.name, 'Test Account'
    assert_equal account.email, 'email@example.com'
  end
end
