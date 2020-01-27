module Mutations
    class CreateMicropost < BaseMutation
        argument :content, String, required: true

        field :micropost, Types::MicropostType, null: false

        def resolve(content:)
            micropost = Micropost.create!(
                content: content,
                user: context[:current_user]
            )
            { micropost: micropost }
        end
    end
end