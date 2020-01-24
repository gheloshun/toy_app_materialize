module GraphqlClient
  module Queries
    class User

      USER_INFO = GraphqlClient::Base::Client.parse <<- 'GRAPHQL'
        query($userID: ID!) {
          showUsers(userID: $userID) {
            ...GraphqlClient::Fragments::User::USER_INFO
          }
        }
      GRAPHQL

    end
  end
end
