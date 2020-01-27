module Mutations
    class AddAuthorization < BaseMutation
        argument :id, ID, required: true
        argument :admin, Boolean, required: true

        field :user, Types::UserType, null: false

        def resolve(id:, admin:)

            if context[:current_user].admin == false
                GraphQL::ExecutionError.new("You dont have authorization to use this feature.")
            else
                user = User.find_by_id(id)
                user.update!(
                    admin: admin
                )
                { user: user }
            end
        end
    end
end