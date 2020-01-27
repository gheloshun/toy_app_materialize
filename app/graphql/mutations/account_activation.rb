module Mutations
    class AccountActivation < BaseMutation
        argument :id, ID, required: true
        argument :activated, Boolean, required: true

        field :user, Types::UserType, null: false

        def resolve(id:, activated:)
            user = User.find_by_id(id)

            user.update!(
                activated: activated
            )
            { user: user }
        end
    end
end