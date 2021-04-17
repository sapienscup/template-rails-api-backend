module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::AccountMutation::CreateUser
    field :create_link, mutation: Mutations::AccountMutation::CreateLink
    field :sign_in_user, mutation: Mutations::AccountMutation::SignInUser
  end
end
