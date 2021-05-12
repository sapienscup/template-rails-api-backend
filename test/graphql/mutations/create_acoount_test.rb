require 'test_helper'

class Mutations::CreateAccountTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::CreateAccount.new(object: nil, field: nil, context: {}).resolve(args)
  end

  test 'create new user' do
    user = perform(
      name: 'Test Account',
      auth_provider: {
        credentials: {
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
