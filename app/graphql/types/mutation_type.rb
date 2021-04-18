module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::AccountMutation::CreateAccount
    field :create_link, mutation: Mutations::AccountMutation::CreateLink
    field :sign_in_user, mutation: Mutations::AccountMutation::SignInAccount
  end
end
