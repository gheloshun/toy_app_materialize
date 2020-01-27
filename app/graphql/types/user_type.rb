module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true
    field :password, String, null: true
    field :activated, Boolean, null: true
  end
end
