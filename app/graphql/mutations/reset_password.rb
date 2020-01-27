module Mutations
    class ResetPassword < BaseMutation
        argument :password, String, required: true
        argument :password_confirmation, String, required: true

        field :user, Types::UserType, null: false

        def resolve(password:, password_confirmation:)
            if password != password_confirmation
                GraphQL::ExecutionError.new("Password does not match")
            else
                user = User.find_by_id(context[:current_user].id)

                user.update!(
                    password: password
                )
                { user: user }
            end
        end
    end
end