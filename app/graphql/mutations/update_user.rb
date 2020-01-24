module Mutations
  class UpdateUser < BaseMutation

    class AuthProviderUpdateData < Types::BaseInputObject
      argument :email, Types::AuthProviderEmailInput, required: false
    end

    argument :id, ID, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :auth_provider, AuthProviderUpdateData, required: true

    field :user, Types::UserType, null: false

    def resolve(id:, first_name:, last_name:, auth_provider:)
      user = User.find(id)

      user.update(
        first_name: first_name,
        last_name: last_name,
        email: auth_provider&.[](:email)&.[](:email),
        password: auth_provider&.[](:email)&.[](:password)
      )
      { user: user }
    end
  end
end
