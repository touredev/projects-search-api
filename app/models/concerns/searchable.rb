module Searchable
  extend ActiveSupport::Concern
 
  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
 
    def as_indexed_json(_options = {})
      as_json(only: %i[name description tech_stack])
    end
 
    settings settings_attributes do
      mappings dynamic: false do
        indexes :name, type: :text, analyzer: :autocomplete
        indexes :description, type: :text, analyzer: :whitespace
        indexes :tech_stack, type: :text, analyzer: :simple
      end
    end
 
    def self.search(query, filters)
      # a lambda function adds conditions to a search definition
      set_filters = lambda do |context_type, filter|
        @search_definition[:query][:bool][context_type] |= [filter]
      end
 
      @search_definition = {
        # we indicate that there should be no more than 5 documents to return
        size: 5,
        query: {
          bool: {
            must: [],
            should: [],
            filter: []
          }
        }
      }
 
      # match all documents
      if query.blank?
        set_filters.call(:must, match_all: {})
      else
        set_filters.call(
          :must,
          match: {
            name: {
              query: query,
              # fuzziness means you can make one typo and still match your document
              fuzziness: 1
            }
          }
        )
      end

      # the system will return only those documents that pass this filter
      if filters[:tech_stack].present?
        set_filters.call(:filter, term: { tech_stack: filters[:tech_stack] })
      end
 
      __elasticsearch__.search(@search_definition)
    end
  end
 
  class_methods do
    def settings_attributes
      {
        index: {
          analysis: {
            analyzer: {
              autocomplete: {
                type: :custom,
                tokenizer: :standard,
                filter: %i[lowercase autocomplete]
              }
            },
            filter: {
              autocomplete: {
                type: :edge_ngram,
                min_gram: 2,
                max_gram: 25
              }
            }
          }
        }
      }
    end
  end

end