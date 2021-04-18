require 'test_helper'

class Resolvers::CreateAccountTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateAccount.new.call(nil, args, nil)
  end

  test 'creating new user' do
    user = perform(
      name: 'Test Account',
      authProvider: {
        email: {
          email: 'email@example.com',
          password: '[omitted]'
        }
      }
    )

    assert user.persisted?
    assert_equal user.name, 'Test Account'
    assert_equal user.email, 'email@example.com'
  end
end
