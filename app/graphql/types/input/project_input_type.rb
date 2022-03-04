module Types
  module Input
    class ProjectInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :description, String, required: false
      argument :tech_stack, [String], required: true
      argument :link, String, required: false
      argument :version, String, required: false
    end
  end
end
