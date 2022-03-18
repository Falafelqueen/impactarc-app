require 'elasticsearch/model'
module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings do
    mappings dynamic: false do
     indexes :organisation, type: :object do
      indexes :title
      indexes :subheading
     end
    end
  end

    def self.search(query)
     __elasticsearch__.search({
       query:{
         multi_match:{
          query: query,
          fields: ['name^5','subheading']
           }
          }
        }
      )
    end
  end
end
