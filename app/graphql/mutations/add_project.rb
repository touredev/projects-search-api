module Mutations
  class AddProject < Mutations::BaseMutation
    argument :params, Types::Input::ProjectInputType, required: true

    field :project, Types::ProjectType, null: false

    def resolve(params:)
      project_params = Hash params

      begin
        project = Project.create!(project_params)

        { project: project }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
