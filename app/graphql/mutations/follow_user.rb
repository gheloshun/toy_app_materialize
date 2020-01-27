module Mutations
  class FollowUser < BaseMutation
    argument :followed_id, ID, required: true

    field :relationship, Types::RelationshipType, null: false

    def resolve(followed_id:)
      relationship = Relationship.create!(
        followed_id: followed_id,
        follower_id: context[:current_user].id
      )
      { relationship: relationship }
    end

  end
end
