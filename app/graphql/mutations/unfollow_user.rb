module Mutations
    class UnfollowUser < BaseMutation
        argument :id, ID, required: true

        field :relationship, Types::RelationshipType, null: false

        def resolve(id:)
            relationship = Relationship.find_by_id(id)

            if(relationship.follower_id != context[:current_user].id)
                GraphQL::ExecutionError.new("You don't have authorization to unfollow this user")
            else
                relationship.destroy!
                { relationship: relationship }
            end
        end
    end
end