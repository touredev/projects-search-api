module Types
  class MutationType < Types::BaseObject
    field :add_project, mutation: Mutations::AddProject
  end
end
