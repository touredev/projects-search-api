module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :fetch_projects, resolver: Queries::FetchProjects
    field :fetch_project, resolver: Queries::FetchProject, description: 'Retrieve a project post by id'

  end
end
