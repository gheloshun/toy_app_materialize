module GraphqlClient
  module Fragments
    class User

      USER_INFO = GraphqlClient::Base::Client.parse <<- 'GRAPHQL'
        fragments on User {
          firstName
          lastName
        }
      GRAPHQL

    end
  end
end
