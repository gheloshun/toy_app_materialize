module Mutations
  class DeleteMicropost < BaseMutation
    argument :id, ID, required: true

    field :micropost, Types::MicropostType, null: false

    def resolve(id:)
      micropost = Micropost.find_by_id(id).destroy
      { micropost: micropost }
    end

  end
end
