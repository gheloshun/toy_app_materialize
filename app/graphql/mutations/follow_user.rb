module Mutations
  class FollowUser < BaseMutation
    argument :followed_id, ID, required: true
    argument :follower_id, ID, required: true

    field :user, [Types::UserType], null: false

    def resolve(followed_id, follower_id)
      Relationship.create!(
        followed_id: followed_id,
        follower_id: follower_id
      )
    end

  end
end
