module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :sign_in_user, mutation: Mutations::SignInUser
    field :delete_micropost, mutation: Mutations::DeleteMicropost
    field :follow_user, mutation: Mutations::FollowUser
    field :create_micropost, mutation: Mutations::CreateMicropost
    field :account_activation, mutation: Mutations::AccountActivation
  end
end
