module Mutations
    class DeleteUser < BaseMutation
        argument :id, ID, required: true

        field :user, Types::UserType, null: false

        def resolve(id:)
            if context[:current_user].admin == false
                GraphQL::ExecutionError.new("You don't have authorization to use this features")
            else
                user = User.find_by_id(id).destroy
                { user: user }
            end
        end
    end
end