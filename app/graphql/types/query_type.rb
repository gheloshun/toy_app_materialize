module Types
  class QueryType < Types::BaseObject
    field :all_users, [UserType], null: false
    field :all_microposts, [MicropostType], null: false

    def all_users
      User.all
    end

    def all_microposts
      Micropost.all
    end

  end
end
