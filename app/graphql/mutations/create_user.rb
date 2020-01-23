module Mutations
  class CreateUser < BaseMutation

    class AuthProviderSignupData < Types::BaseInputObject
      argument :email, Types::AuthProviderEmailInput, required: false
    end

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: true

    field :user, Types::UserType, null: false

    def resolve(first_name: nil, last_name: nil, auth_provider: nil)
      user = User.create!(
        first_name: first_name,
        last_name: last_name,
        email: auth_provider&.[](:email)&.[](:email),
        password: auth_provider&.[](:email)&.[](:password)
      )
      { user: user }
    end
    
  end
end
