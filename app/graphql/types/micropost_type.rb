module Types
  class MicropostType < BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :user, UserType, null: false
  end
end
