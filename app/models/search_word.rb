class SearchWord < ApplicationRecord
  has_many :tags
  has_many :organisations, through: :tags
end
