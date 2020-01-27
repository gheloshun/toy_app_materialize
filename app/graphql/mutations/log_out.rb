module Mutations
    class LogOut < BaseMutation
        
        field :token, String, null: true

        def resolve
            context[:session][:token] = nil
            { token: context[:session][:token] }
        end
    end
end