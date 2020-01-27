module Types
    class RelationshipType < BaseObject
        field :id, ID, null: false
        field :follower_id, ID, null: false
        field :followed_id, ID, null: false
    end
end